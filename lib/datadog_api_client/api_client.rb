=begin
#Datadog API V2 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://github.com/DataDog/datadog-api-client-ruby/tree/master/.generator

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'date'
require 'json'
require 'logger'
require 'tempfile'
require 'time'
require 'httparty'
begin
  require 'zstandard'
rescue LoadError
end

module DatadogAPIClient
  class APIClient
    # The Configuration object holding settings to be used in the API client.
    attr_accessor :config

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    attr_accessor :default_headers

    # Initializes the APIClient
    # @option config [Configuration] Configuration for initializing the object, default to Configuration.default
    def initialize(config = Configuration.default)
      @config = config
      @user_agent = "#{DatadogAPIClient::USER_AGENT}"
      @default_headers = {
        'User-Agent' => @user_agent
      }
      @default_headers['Accept-Encoding'] = 'gzip' if @config.compress
    end

    def self.default
      @@default ||= APIClient.new
    end

    # Call an API with given options.
    #
    # @return [Array<(Object, Integer, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code and response headers.
    def call_api(http_method, path, opts = {})
      request = build_request(http_method, path, opts)
      if opts[:stream_body]
        tempfile = nil
        encoding = nil

        response = request.perform do | chunk |
          unless tempfile
            content_disposition = chunk.http_response.header['Content-Disposition']
            if content_disposition && content_disposition =~ /filename=/i
              filename = content_disposition[/filename=['"]?([^'"\s]+)['"]?/, 1]
              prefix = sanitize_filename(filename)
            else
              prefix = 'download-'
            end
            prefix = prefix + '-' unless prefix.end_with?('-')
            unless encoding
              encoding = chunk.encoding
            end
            tempfile = Tempfile.open(prefix, @config.temp_folder_path, encoding: encoding)
            @tempfile = tempfile
          end
          chunk.force_encoding(encoding)
          tempfile.write(chunk)
        end
        if tempfile
          tempfile.close
          @config.logger.info "Temp file written to #{tempfile.path}, please copy the file to a proper folder "\
                            "with e.g. `FileUtils.cp(tempfile.path, '/new/file/path')` otherwise the temp file "\
                            "will be deleted automatically with GC. It's also recommended to delete the temp file "\
                            "explicitly with `tempfile.delete`"
        end
      else
        response = request.perform
      end

      if @config.debugging
        @config.logger.debug "HTTP response body ~BEGIN~\n#{response.body}\n~END~\n"
      end

      unless response.success?
        if response.request_timeout?
          fail APIError.new('Connection timed out')
        elsif response.code == 0
          # Errors from libcurl will be made visible here
          fail APIError.new(:code => 0,
                            :message => response.return_message)
        else
          body = response.body
          if response.headers['Content-Encoding'].eql?('gzip') && !(body.nil? || body.empty?) then
            gzip = Zlib::Inflate.new(Zlib::MAX_WBITS + 16)
            body = gzip.inflate(body)
            gzip.close
          end
          fail APIError.new(:code => response.code,
                            :response_headers => response.headers,
                            :response_body => body),
               response.message
        end
      end

      if opts[:return_type]
        data = deserialize(opts[:api_version], response, opts[:return_type])
      else
        data = nil
      end
      return data, response.code, response.headers
    end

    # Build the HTTP request
    #
    # @param [String] http_method HTTP method/verb (e.g. POST)
    # @param [String] path URL path (e.g. /account/new)
    # @option opts [Hash] :header_params Header parameters
    # @option opts [Hash] :query_params Query parameters
    # @option opts [Hash] :form_params Query parameters
    # @option opts [Object] :body HTTP body (JSON/XML)
    # @return [HTTParty::Request] A httparty Request
    def build_request(http_method, path, opts = {})
      url = build_request_url(path, opts)
      header_params = @default_headers.merge(opts[:header_params] || {})
      query_params = opts[:query_params] || {}
      form_params = opts[:form_params] || {}

      update_params_for_auth! header_params, query_params, opts[:auth_names]

      # set ssl_verifyhosts option based on @config.verify_ssl_host (true/false)
      _verify_ssl_host = @config.verify_ssl_host ? 2 : 0

      req_opts = {
        :method => http_method,
        :headers => header_params,
        :query => query_params,
        :timeout => @config.timeout,
        :verify_peer => @config.verify_ssl,
        :verify => _verify_ssl_host,
        :verbose => @config.debugging
      }

      req_opts[:pem] = File.read(@config.cert_file) if @config.cert_file
      req_opts[:pem_password] = File.read(@config.key_file) if @config.key_file

      opts[:stream_body] = true if opts[:return_type] == 'File'

      # set custom cert, if provided
      req_opts[:ssl_ca_file] = File.read(@config.ssl_ca_cert) if @config.ssl_ca_cert

      if ["POST", "PATCH", "PUT", "DELETE"].include?(http_method.const_get(:METHOD))
        req_body = build_request_body(header_params, form_params, opts[:body])
        req_opts.update :body => req_body
        if @config.debugging
          @config.logger.debug "HTTP request body param ~BEGIN~\n#{req_body}\n~END~\n"
        end
      end

      HTTParty::Request.new(http_method, url, req_opts)
    end

    # Build the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body(header_params, form_params, body)
      # http form
      if header_params['Content-Type'] == 'application/x-www-form-urlencoded' ||
          header_params['Content-Type'] == 'multipart/form-data'
        data = {}
        form_params.each do |key, value|
          case value
          when ::File, ::Array, nil
            # let httparty handle File, Array and nil parameters
            data[key] = value
          else
            data[key] = value.to_s
          end
        end
      elsif body
        data = body.is_a?(String) ? body : body.to_json
      else
        data = nil
      end
      if header_params['Content-Encoding'] == 'gzip'
        gzip = Zlib::Deflate.new(nil, Zlib::MAX_WBITS + 16)
        data = gzip.deflate(data, Zlib::FINISH)
        gzip.close
      elsif header_params['Content-Encoding'] == 'deflate'
        data = Zlib::deflate(data)
      elsif header_params['Content-Encoding'] == 'zstd1'
        data = Zstandard.deflate(data)
      end
      data
    end

    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    #   */*
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is application/json
    def json_mime?(mime)
      (mime == '*/*') || !(mime =~ /Application\/.*json(?!p)(;.*)?/i).nil? || (mime == 'text/json')
    end

    # Deserialize the response to the given return type.
    #
    # @param [String] the api version
    # @param [Response] response HTTP response
    # @param [String] return_type some examples: "User", "Array<User>", "Hash<String, Integer>"
    def deserialize(api_version, response, return_type)
      body = response.body

      # handle file downloading - return the File instance processed in request callbacks
      # note that response body is empty when the file is written in chunks in request on_body callback
      return @tempfile if return_type == 'File'

      return nil if body.nil? || body.empty?

      if response.headers['Content-Encoding'].eql?('gzip') then
        gzip = Zlib::Inflate.new(Zlib::MAX_WBITS + 16)
        body = gzip.inflate(body)
        gzip.close
      end

      # return response body directly for String return type
      return body if return_type == 'String'

      # ensuring a default content type
      content_type = response.headers['Content-Type'] || 'application/json'

      fail "Content-Type is not supported: #{content_type}" unless json_mime?(content_type)

      begin
        data = JSON.parse("[#{body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w(String Date Time).include?(return_type)
          data = body
        else
          raise e
        end
      end

      convert_to_type data, return_type, api_version
    end

    # Convert data to the given return type.
    # @param [Object] data Data to be converted
    # @param [String] return_type Return type
    # @return [Mixed] Data in a particular type
    def convert_to_type(data, return_type, api_version)
      return nil if data.nil?
      case return_type
      when 'String'
        data.to_s
      when 'Integer'
        data.to_i
      when 'Float'
        data.to_f
      when 'Boolean'
        data == true
      when 'Time'
        # parse date time (expecting ISO 8601 format)
        Time.parse data
      when 'Date'
        # parse date time (expecting ISO 8601 format)
        Date.parse data
      when 'Object'
        # generic object (usually a Hash), return directly
        data
      when /\AArray<(.+)>\z/
        # e.g. Array<Pet>
        sub_type = $1
        data.map { |item| convert_to_type(item, sub_type, api_version) }
      when /\AHash\<String, (.+)\>\z/
        # e.g. Hash<String, Integer>
        sub_type = $1
        {}.tap do |hash|
          data.each { |k, v| hash[k] = convert_to_type(v, sub_type, api_version) }
        end
      else
        # models (e.g. Pet) or oneOf
        klass = DatadogAPIClient.const_get(api_version).const_get(return_type)
        klass.respond_to?(:openapi_one_of) ? klass.build(data) : klass.build_from_hash(data)
      end
    end

    # Sanitize filename by removing path.
    # e.g. ../../sun.gif becomes sun.gif
    #
    # @param [String] filename the filename to be sanitized
    # @return [String] the sanitized filename
    def sanitize_filename(filename)
      filename.gsub(/.*[\/\\]/, '')
    end

    def build_request_url(path, opts = {})
      # Add leading and trailing slashes to path
      path = "/#{path}".gsub(/\/+/, '/')
      @config.base_url("#{opts[:api_version].respond_to?(:downcase) ? opts[:api_version].downcase : opts[:api_version]}.#{opts[:operation]}") + path
    end

    # Update header and query params based on authentication settings.
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] query_params Query parameters
    # @param [String] auth_names Authentication scheme name
    def update_params_for_auth!(header_params, query_params, auth_names)
      Array(auth_names).each do |auth_name|
        auth_setting = @config.auth_settings[auth_name]
        next unless auth_setting
        case auth_setting[:in]
        when 'header' then header_params[auth_setting[:key]] = auth_setting[:value]
        when 'query'  then query_params[auth_setting[:key]] = auth_setting[:value]
        else fail ArgumentError, 'Authentication token must be in `query` or `header`'
        end
      end
    end

    # Sets user agent in HTTP header
    #
    # @param [String] user_agent User agent (e.g. openapi-generator/ruby/1.0.0)
    def user_agent=(user_agent)
      @user_agent = user_agent
      @default_headers['User-Agent'] = @user_agent
    end

    # Return Accept header based on an array of accepts provided.
    # @param [Array] accepts array for Accept
    # @return [String] the Accept header (e.g. application/json)
    def select_header_accept(accepts)
      return nil if accepts.nil? || accepts.empty?
      accepts.join(', ')
    end

    # Return Content-Type header based on an array of content types provided.
    # @param [Array] content_types array for Content-Type
    # @return [String] the Content-Type header  (e.g. application/json)
    def select_header_content_type(content_types)
      # use application/json by default
      return 'application/json' if content_types.nil? || content_types.empty?
      # use JSON when present, otherwise use the first one
      json_content_type = content_types.find { |s| json_mime?(s) }
      json_content_type || content_types.first
    end

    # Convert object (array, hash, object, etc) to JSON string.
    # @param [Object] model object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_http_body(model)
      return model if model.nil? || model.is_a?(String)
      local_body = nil
      if model.is_a?(Array)
        local_body = model.map { |m| object_to_hash(m) }
      else
        local_body = object_to_hash(model)
      end
      transform_hash(local_body).to_json
    end

    # Transform object (array, hash, object, etc) to serializable object.
    # @param [Object] obj to transform
    # @return [Object]
    def transform_hash(obj)
      if obj.is_a?(Array)
        obj.map { |m| transform_hash(m) }
      elsif obj.is_a?(Hash)
        obj.each do | k, v |
          if v.class == Time
            obj[k] = v.nsec == 0 ? v.rfc3339 : v.rfc3339(3)
          else
            obj[k] = transform_hash(v)
          end
        end
      end

      obj
    end

    # Convert object(non-array) to hash.
    # @param [Object] obj object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_hash(obj)
      if obj.respond_to?(:to_hash)
        obj.to_hash
      else
        obj
      end
    end

    # Build parameter value according to the given collection format.
    # @param [String] collection_format one of :csv, :ssv, :tsv, :pipes and :multi
    def build_collection_param(param, collection_format)
      case collection_format
      when :csv
        param.join(',')
      when :ssv
        param.join(' ')
      when :tsv
        param.join("\t")
      when :pipes
        param.join('|')
      when :multi
        # return the array directly as httparty will handle it as expected
        param
      else
        fail "unknown collection format: #{collection_format.inspect}"
      end
    end


    # Retrieve an attribute from a path specification.
    #
    # @param [Object] obj The source object
    # @param [String] attribute_path The path spefication, separated by "."
    # @param [Object] default The default value, if not found
    # @return [Object] The value found, or default
    # @!visibility private
    def get_attribute_from_path(obj, attribute_path, default=nil)
      for attr in attribute_path.split(".") do
        case obj
        when Hash
          obj = !obj[attr.to_sym].nil? ? obj[attr.to_sym] : obj[attr]
        else
          obj = obj.send(attr)
        end
        return default if obj.nil?
      end
      obj
    end

    # Set an attribute at the given path
    #
    # @param [String] api_version The api version
    # @param [Object] obj The source object
    # @param [String] attribute_path The path spefication, separated by "."
    # @param [Object] builder The class matching the top level attribute
    # @param [Object] value The value to set
    # @!visibility private
    def set_attribute_from_path(api_version, obj, attribute_path, builder, value)
      attrs = attribute_path.split(".")
      last = attrs.pop
      i = 0
      for attr in attrs do
        case obj
        when Hash
          obj = !obj[attr.to_sym].nil? ? obj[attr.to_sym] : obj[attr]
        else
          obj = obj.send(attr)
        end
        builder = DatadogAPIClient.const_get(api_version).const_get(builder.openapi_types[attr.to_sym]) if i > 0
        obj = builder.new if obj.nil?
        i += 1
      end
      case obj
      when Hash
        obj[last.to_sym] = value
      else
        obj.send(last + "=", value)
      end
    end
  end

  class APIError < StandardError
    attr_reader :code, :response_headers, :response_body

    # Usage examples:
    #   APIError.new
    #   APIError.new("message")
    #   APIError.new(:code => 500, :response_headers => {}, :response_body => "")
    #   APIError.new(:code => 404, :message => "Not Found")
    def initialize(arg = nil)
      if arg.is_a? Hash
        if arg.key?(:message) || arg.key?('message')
          super(arg[:message] || arg['message'])
        else
          super arg
        end

        arg.each do |k, v|
          instance_variable_set "@#{k}", v
        end
      else
        super arg
      end
    end

    # Override to_s to display a friendly error message
    def to_s
      message
    end

    def message
      if @message.nil?
        msg = "Error message: the server returns an error"
      else
        msg = @message
      end

      msg += "\nHTTP status code: #{code}" if code
      msg += "\nResponse headers: #{response_headers}" if response_headers
      msg += "\nResponse body: #{response_body}" if response_body

      msg
    end
  end
end
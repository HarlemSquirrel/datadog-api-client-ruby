=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://github.com/DataDog/datadog-api-client-ruby/tree/master/.generator

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'cgi'

module DatadogAPIClient::V1
  class NotebooksAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Create a notebook.
    #
    # @see #create_notebook_with_http_info
    def create_notebook(body, opts = {})
      data, _status_code, _headers = create_notebook_with_http_info(body, opts)
      data
    end

    # Create a notebook.
    #
    # Create a notebook using the specified options.
    #
    # @param body [NotebookCreateRequest] The JSON description of the notebook you want to create.
    # @param opts [Hash] the optional parameters
    # @return [Array<(NotebookResponse, Integer, Hash)>] NotebookResponse data, response status code and response headers
    def create_notebook_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: NotebooksAPI.create_notebook ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling NotebooksAPI.create_notebook"
      end
      # resource path
      local_var_path = '/api/v1/notebooks'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'NotebookResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :create_notebook,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V1"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Post, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: NotebooksAPI#create_notebook\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a notebook.
    #
    # @see #delete_notebook_with_http_info
    def delete_notebook(notebook_id, opts = {})
      delete_notebook_with_http_info(notebook_id, opts)
      nil
    end

    # Delete a notebook.
    #
    # Delete a notebook using the specified ID.
    #
    # @param notebook_id [Integer] Unique ID, assigned when you create the notebook.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_notebook_with_http_info(notebook_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: NotebooksAPI.delete_notebook ...'
      end
      # verify the required parameter 'notebook_id' is set
      if @api_client.config.client_side_validation && notebook_id.nil?
        fail ArgumentError, "Missing the required parameter 'notebook_id' when calling NotebooksAPI.delete_notebook"
      end
      # resource path
      local_var_path = '/api/v1/notebooks/{notebook_id}'.sub('{notebook_id}', CGI.escape(notebook_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :delete_notebook,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V1"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Delete, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: NotebooksAPI#delete_notebook\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a notebook.
    #
    # @see #get_notebook_with_http_info
    def get_notebook(notebook_id, opts = {})
      data, _status_code, _headers = get_notebook_with_http_info(notebook_id, opts)
      data
    end

    # Get a notebook.
    #
    # Get a notebook using the specified notebook ID.
    #
    # @param notebook_id [Integer] Unique ID, assigned when you create the notebook.
    # @param opts [Hash] the optional parameters
    # @return [Array<(NotebookResponse, Integer, Hash)>] NotebookResponse data, response status code and response headers
    def get_notebook_with_http_info(notebook_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: NotebooksAPI.get_notebook ...'
      end
      # verify the required parameter 'notebook_id' is set
      if @api_client.config.client_side_validation && notebook_id.nil?
        fail ArgumentError, "Missing the required parameter 'notebook_id' when calling NotebooksAPI.get_notebook"
      end
      # resource path
      local_var_path = '/api/v1/notebooks/{notebook_id}'.sub('{notebook_id}', CGI.escape(notebook_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'NotebookResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :get_notebook,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V1"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: NotebooksAPI#get_notebook\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all notebooks.
    #
    # @see #list_notebooks_with_http_info
    def list_notebooks(opts = {})
      data, _status_code, _headers = list_notebooks_with_http_info(opts)
      data
    end

    # Get all notebooks.
    #
    # Get all notebooks. This can also be used to search for notebooks with a particular `query` in the notebook
    # `name` or author `handle`.
    #
    # @param opts [Hash] the optional parameters
    # @option opts [String] :author_handle Return notebooks created by the given `author_handle`.
    # @option opts [String] :exclude_author_handle Return notebooks not created by the given `author_handle`.
    # @option opts [Integer] :start The index of the first notebook you want returned.
    # @option opts [Integer] :count The number of notebooks to be returned.
    # @option opts [String] :sort_field Sort by field `modified`, `name`, or `created`.
    # @option opts [String] :sort_dir Sort by direction `asc` or `desc`.
    # @option opts [String] :query Return only notebooks with `query` string in notebook name or author handle.
    # @option opts [Boolean] :include_cells Value of `false` excludes the `cells` and global `time` for each notebook.
    # @option opts [Boolean] :is_template True value returns only template notebooks. Default is false (returns only non-template notebooks).
    # @option opts [String] :type If type is provided, returns only notebooks with that metadata type. Default does not have type filtering.
    # @return [Array<(NotebooksResponse, Integer, Hash)>] NotebooksResponse data, response status code and response headers
    def list_notebooks_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: NotebooksAPI.list_notebooks ...'
      end
      # resource path
      local_var_path = '/api/v1/notebooks'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'author_handle'] = opts[:'author_handle'] if !opts[:'author_handle'].nil?
      query_params[:'exclude_author_handle'] = opts[:'exclude_author_handle'] if !opts[:'exclude_author_handle'].nil?
      query_params[:'start'] = opts[:'start'] if !opts[:'start'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'sort_field'] = opts[:'sort_field'] if !opts[:'sort_field'].nil?
      query_params[:'sort_dir'] = opts[:'sort_dir'] if !opts[:'sort_dir'].nil?
      query_params[:'query'] = opts[:'query'] if !opts[:'query'].nil?
      query_params[:'include_cells'] = opts[:'include_cells'] if !opts[:'include_cells'].nil?
      query_params[:'is_template'] = opts[:'is_template'] if !opts[:'is_template'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'NotebooksResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :list_notebooks,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V1"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: NotebooksAPI#list_notebooks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update a notebook.
    #
    # @see #update_notebook_with_http_info
    def update_notebook(notebook_id, body, opts = {})
      data, _status_code, _headers = update_notebook_with_http_info(notebook_id, body, opts)
      data
    end

    # Update a notebook.
    #
    # Update a notebook using the specified ID.
    #
    # @param notebook_id [Integer] Unique ID, assigned when you create the notebook.
    # @param body [NotebookUpdateRequest] Update notebook request body.
    # @param opts [Hash] the optional parameters
    # @return [Array<(NotebookResponse, Integer, Hash)>] NotebookResponse data, response status code and response headers
    def update_notebook_with_http_info(notebook_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: NotebooksAPI.update_notebook ...'
      end
      # verify the required parameter 'notebook_id' is set
      if @api_client.config.client_side_validation && notebook_id.nil?
        fail ArgumentError, "Missing the required parameter 'notebook_id' when calling NotebooksAPI.update_notebook"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling NotebooksAPI.update_notebook"
      end
      # resource path
      local_var_path = '/api/v1/notebooks/{notebook_id}'.sub('{notebook_id}', CGI.escape(notebook_id.to_s).gsub('%2F', '/'))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'NotebookResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :update_notebook,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V1"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Put, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: NotebooksAPI#update_notebook\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

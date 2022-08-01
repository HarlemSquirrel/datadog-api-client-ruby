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
  class ServiceChecksAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Submit a Service Check.
    #
    # @see #submit_service_check_with_http_info
    def submit_service_check(body, opts = {})
      data, _status_code, _headers = submit_service_check_with_http_info(body, opts)
      data
    end

    # Submit a Service Check.
    #
    # Submit a list of Service Checks.
    #
    # **Notes**:
    # - A valid API key is required.
    # - Service checks can be submitted up to 10 minutes in the past.
    #
    # @param body [Array<ServiceCheck>] Service Check request body.
    # @param opts [Hash] the optional parameters
    # @return [Array<(IntakePayloadAccepted, Integer, Hash)>] IntakePayloadAccepted data, response status code and response headers
    def submit_service_check_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ServiceChecksAPI.submit_service_check ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling ServiceChecksAPI.submit_service_check"
      end
      # resource path
      local_var_path = '/api/v1/check_run'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/json', 'application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body)

      # return_type
      return_type = opts[:debug_return_type] || 'IntakePayloadAccepted'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth]

      new_options = opts.merge(
        :operation => :submit_service_check,
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
        @api_client.config.logger.debug "API called: ServiceChecksAPI#submit_service_check\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

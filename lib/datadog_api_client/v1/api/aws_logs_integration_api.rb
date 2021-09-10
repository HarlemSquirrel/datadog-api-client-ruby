=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'cgi'

module DatadogAPIClient::V1
  class AWSLogsIntegrationAPI
    attr_accessor :api_client

    def initialize(api_client = APIClient.default)
      @api_client = api_client
    end
    # Check that an AWS Lambda Function exists
    # Test if permissions are present to add a log-forwarding triggers for the given services and AWS account. The input is the same as for Enable an AWS service log collection. Subsequent requests will always repeat the above, so this endpoint can be polled intermittently instead of blocking.  - Returns a status of 'created' when it's checking if the Lambda exists in the account. - Returns a status of 'waiting' while checking. - Returns a status of 'checked and ok' if the Lambda exists. - Returns a status of 'error' if the Lambda does not exist.
    # @param body [AWSAccountAndLambdaRequest] Check AWS Log Lambda Async request body.
    # @param [Hash] opts the optional parameters
    # @return [AWSLogsAsyncResponse]
    def check_aws_logs_lambda_async(body, opts = {})
      data, _status_code, _headers = check_aws_logs_lambda_async_with_http_info(body, opts)
      data
    end

    # Check that an AWS Lambda Function exists
    # Test if permissions are present to add a log-forwarding triggers for the given services and AWS account. The input is the same as for Enable an AWS service log collection. Subsequent requests will always repeat the above, so this endpoint can be polled intermittently instead of blocking.  - Returns a status of &#39;created&#39; when it&#39;s checking if the Lambda exists in the account. - Returns a status of &#39;waiting&#39; while checking. - Returns a status of &#39;checked and ok&#39; if the Lambda exists. - Returns a status of &#39;error&#39; if the Lambda does not exist.
    # @param body [AWSAccountAndLambdaRequest] Check AWS Log Lambda Async request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(AWSLogsAsyncResponse, Integer, Hash)>] AWSLogsAsyncResponse data, response status code and response headers
    def check_aws_logs_lambda_async_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:check_aws_logs_lambda_async)
        unstable_enabled = @api_client.config.unstable_operations[:check_aws_logs_lambda_async]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "check_aws_logs_lambda_async")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "check_aws_logs_lambda_async"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.check_aws_logs_lambda_async ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling AWSLogsIntegrationAPI.check_aws_logs_lambda_async"
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs/check_async'

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
      return_type = opts[:debug_return_type] || 'AWSLogsAsyncResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:AuthZ, :apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :check_aws_logs_lambda_async,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#check_aws_logs_lambda_async\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Check permissions for log services
    # Test if permissions are present to add log-forwarding triggers for the given services and AWS account. Input is the same as for `EnableAWSLogServices`. Done async, so can be repeatedly polled in a non-blocking fashion until the async request completes.  - Returns a status of `created` when it's checking if the permissions exists   in the AWS account. - Returns a status of `waiting` while checking. - Returns a status of `checked and ok` if the Lambda exists. - Returns a status of `error` if the Lambda does not exist.
    # @param body [AWSLogsServicesRequest] Check AWS Logs Async Services request body.
    # @param [Hash] opts the optional parameters
    # @return [AWSLogsAsyncResponse]
    def check_aws_logs_services_async(body, opts = {})
      data, _status_code, _headers = check_aws_logs_services_async_with_http_info(body, opts)
      data
    end

    # Check permissions for log services
    # Test if permissions are present to add log-forwarding triggers for the given services and AWS account. Input is the same as for &#x60;EnableAWSLogServices&#x60;. Done async, so can be repeatedly polled in a non-blocking fashion until the async request completes.  - Returns a status of &#x60;created&#x60; when it&#39;s checking if the permissions exists   in the AWS account. - Returns a status of &#x60;waiting&#x60; while checking. - Returns a status of &#x60;checked and ok&#x60; if the Lambda exists. - Returns a status of &#x60;error&#x60; if the Lambda does not exist.
    # @param body [AWSLogsServicesRequest] Check AWS Logs Async Services request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(AWSLogsAsyncResponse, Integer, Hash)>] AWSLogsAsyncResponse data, response status code and response headers
    def check_aws_logs_services_async_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:check_aws_logs_services_async)
        unstable_enabled = @api_client.config.unstable_operations[:check_aws_logs_services_async]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "check_aws_logs_services_async")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "check_aws_logs_services_async"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.check_aws_logs_services_async ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling AWSLogsIntegrationAPI.check_aws_logs_services_async"
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs/services_async'

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
      return_type = opts[:debug_return_type] || 'AWSLogsAsyncResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :check_aws_logs_services_async,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#check_aws_logs_services_async\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add AWS Log Lambda ARN
    # Attach the Lambda ARN of the Lambda created for the Datadog-AWS log collection to your AWS account ID to enable log collection.
    # @param body [AWSAccountAndLambdaRequest] AWS Log Lambda Async request body.
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def create_aws_lambda_arn(body, opts = {})
      data, _status_code, _headers = create_aws_lambda_arn_with_http_info(body, opts)
      data
    end

    # Add AWS Log Lambda ARN
    # Attach the Lambda ARN of the Lambda created for the Datadog-AWS log collection to your AWS account ID to enable log collection.
    # @param body [AWSAccountAndLambdaRequest] AWS Log Lambda Async request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def create_aws_lambda_arn_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:create_aws_lambda_arn)
        unstable_enabled = @api_client.config.unstable_operations[:create_aws_lambda_arn]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "create_aws_lambda_arn")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "create_aws_lambda_arn"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.create_aws_lambda_arn ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling AWSLogsIntegrationAPI.create_aws_lambda_arn"
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs'

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
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :create_aws_lambda_arn,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#create_aws_lambda_arn\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete an AWS Logs integration
    # Delete a Datadog-AWS logs configuration by removing the specific Lambda ARN associated with a given AWS account.
    # @param body [AWSAccountAndLambdaRequest] Delete AWS Lambda ARN request body.
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def delete_aws_lambda_arn(body, opts = {})
      data, _status_code, _headers = delete_aws_lambda_arn_with_http_info(body, opts)
      data
    end

    # Delete an AWS Logs integration
    # Delete a Datadog-AWS logs configuration by removing the specific Lambda ARN associated with a given AWS account.
    # @param body [AWSAccountAndLambdaRequest] Delete AWS Lambda ARN request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def delete_aws_lambda_arn_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:delete_aws_lambda_arn)
        unstable_enabled = @api_client.config.unstable_operations[:delete_aws_lambda_arn]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "delete_aws_lambda_arn")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "delete_aws_lambda_arn"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.delete_aws_lambda_arn ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling AWSLogsIntegrationAPI.delete_aws_lambda_arn"
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs'

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
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :delete_aws_lambda_arn,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#delete_aws_lambda_arn\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Enable an AWS Logs integration
    # Enable automatic log collection for a list of services. This should be run after running `CreateAWSLambdaARN` to save the configuration.
    # @param body [AWSLogsServicesRequest] Enable AWS Log Services request body.
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def enable_aws_log_services(body, opts = {})
      data, _status_code, _headers = enable_aws_log_services_with_http_info(body, opts)
      data
    end

    # Enable an AWS Logs integration
    # Enable automatic log collection for a list of services. This should be run after running &#x60;CreateAWSLambdaARN&#x60; to save the configuration.
    # @param body [AWSLogsServicesRequest] Enable AWS Log Services request body.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def enable_aws_log_services_with_http_info(body, opts = {})

      if @api_client.config.unstable_operations.has_key?(:enable_aws_log_services)
        unstable_enabled = @api_client.config.unstable_operations[:enable_aws_log_services]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "enable_aws_log_services")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "enable_aws_log_services"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.enable_aws_log_services ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling AWSLogsIntegrationAPI.enable_aws_log_services"
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs/services'

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
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :enable_aws_log_services,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#enable_aws_log_services\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List all AWS Logs integrations
    # List all Datadog-AWS Logs integrations configured in your Datadog account.
    # @param [Hash] opts the optional parameters
    # @return [Array<AWSLogsListResponse>]
    def list_aws_logs_integrations(opts = {})
      data, _status_code, _headers = list_aws_logs_integrations_with_http_info(opts)
      data
    end

    # List all AWS Logs integrations
    # List all Datadog-AWS Logs integrations configured in your Datadog account.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<AWSLogsListResponse>, Integer, Hash)>] Array<AWSLogsListResponse> data, response status code and response headers
    def list_aws_logs_integrations_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:list_aws_logs_integrations)
        unstable_enabled = @api_client.config.unstable_operations[:list_aws_logs_integrations]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "list_aws_logs_integrations")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "list_aws_logs_integrations"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.list_aws_logs_integrations ...'
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs'

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
      return_type = opts[:debug_return_type] || 'Array<AWSLogsListResponse>'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :list_aws_logs_integrations,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#list_aws_logs_integrations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get list of AWS log ready services
    # Get the list of current AWS services that Datadog offers automatic log collection. Use returned service IDs with the services parameter for the Enable an AWS service log collection API endpoint.
    # @param [Hash] opts the optional parameters
    # @return [Array<AWSLogsListServicesResponse>]
    def list_aws_logs_services(opts = {})
      data, _status_code, _headers = list_aws_logs_services_with_http_info(opts)
      data
    end

    # Get list of AWS log ready services
    # Get the list of current AWS services that Datadog offers automatic log collection. Use returned service IDs with the services parameter for the Enable an AWS service log collection API endpoint.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<AWSLogsListServicesResponse>, Integer, Hash)>] Array<AWSLogsListServicesResponse> data, response status code and response headers
    def list_aws_logs_services_with_http_info(opts = {})

      if @api_client.config.unstable_operations.has_key?(:list_aws_logs_services)
        unstable_enabled = @api_client.config.unstable_operations[:list_aws_logs_services]
        if unstable_enabled
          @api_client.config.logger.warn format("Using unstable operation '%s'", "list_aws_logs_services")
        else
          raise APIError.new(message: format("Unstable operation '%s' is disabled", "list_aws_logs_services"))
        end
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AWSLogsIntegrationAPI.list_aws_logs_services ...'
      end
      # resource path
      local_var_path = '/api/v1/integration/aws/logs/services'

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
      return_type = opts[:debug_return_type] || 'Array<AWSLogsListServicesResponse>'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :list_aws_logs_services,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AWSLogsIntegrationAPI#list_aws_logs_services\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

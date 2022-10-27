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

require 'cgi'

module DatadogAPIClient::V2
  class CloudWorkloadSecurityAPI
    attr_accessor :api_client

    def initialize(api_client = DatadogAPIClient::APIClient.default)
      @api_client = api_client
    end

    # Create a Cloud Workload Security Agent rule.
    #
    # @see #create_cloud_workload_security_agent_rule_with_http_info
    def create_cloud_workload_security_agent_rule(body, opts = {})
      data, _status_code, _headers = create_cloud_workload_security_agent_rule_with_http_info(body, opts)
      data
    end

    # Create a Cloud Workload Security Agent rule.
    #
    # Create a new Agent rule with the given parameters.
    #
    # @param body [CloudWorkloadSecurityAgentRuleCreateRequest] The definition of the new Agent rule.
    # @param opts [Hash] the optional parameters
    # @return [Array<(CloudWorkloadSecurityAgentRuleResponse, Integer, Hash)>] CloudWorkloadSecurityAgentRuleResponse data, response status code and response headers
    def create_cloud_workload_security_agent_rule_with_http_info(body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.create_cloud_workload_security_agent_rule ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CloudWorkloadSecurityAPI.create_cloud_workload_security_agent_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/cloud_workload_security/agent_rules'

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
      return_type = opts[:debug_return_type] || 'CloudWorkloadSecurityAgentRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :create_cloud_workload_security_agent_rule,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Post, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#create_cloud_workload_security_agent_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a Cloud Workload Security Agent rule.
    #
    # @see #delete_cloud_workload_security_agent_rule_with_http_info
    def delete_cloud_workload_security_agent_rule(agent_rule_id, opts = {})
      delete_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, opts)
      nil
    end

    # Delete a Cloud Workload Security Agent rule.
    #
    # Delete a specific Agent rule.
    #
    # @param agent_rule_id [String] The ID of the Agent rule.
    # @param opts [Hash] the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.delete_cloud_workload_security_agent_rule ...'
      end
      # verify the required parameter 'agent_rule_id' is set
      if @api_client.config.client_side_validation && agent_rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'agent_rule_id' when calling CloudWorkloadSecurityAPI.delete_cloud_workload_security_agent_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/cloud_workload_security/agent_rules/{agent_rule_id}'.sub('{agent_rule_id}', CGI.escape(agent_rule_id.to_s).gsub('%2F', '/'))

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
        :operation => :delete_cloud_workload_security_agent_rule,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Delete, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#delete_cloud_workload_security_agent_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get the latest Cloud Workload Security policy.
    #
    # @see #download_cloud_workload_policy_file_with_http_info
    def download_cloud_workload_policy_file(opts = {})
      data, _status_code, _headers = download_cloud_workload_policy_file_with_http_info(opts)
      data
    end

    # Get the latest Cloud Workload Security policy.
    #
    # The download endpoint generates a Cloud Workload Security policy file from your currently active
    # Cloud Workload Security rules, and downloads them as a .policy file. This file can then be deployed to
    # your Agents to update the policy running in your environment.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def download_cloud_workload_policy_file_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.download_cloud_workload_policy_file ...'
      end
      # resource path
      local_var_path = '/api/v2/security/cloud_workload/policy/download'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/yaml', 'application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :download_cloud_workload_policy_file,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#download_cloud_workload_policy_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a Cloud Workload Security Agent rule.
    #
    # @see #get_cloud_workload_security_agent_rule_with_http_info
    def get_cloud_workload_security_agent_rule(agent_rule_id, opts = {})
      data, _status_code, _headers = get_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, opts)
      data
    end

    # Get a Cloud Workload Security Agent rule.
    #
    # Get the details of a specific Agent rule.
    #
    # @param agent_rule_id [String] The ID of the Agent rule.
    # @param opts [Hash] the optional parameters
    # @return [Array<(CloudWorkloadSecurityAgentRuleResponse, Integer, Hash)>] CloudWorkloadSecurityAgentRuleResponse data, response status code and response headers
    def get_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.get_cloud_workload_security_agent_rule ...'
      end
      # verify the required parameter 'agent_rule_id' is set
      if @api_client.config.client_side_validation && agent_rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'agent_rule_id' when calling CloudWorkloadSecurityAPI.get_cloud_workload_security_agent_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/cloud_workload_security/agent_rules/{agent_rule_id}'.sub('{agent_rule_id}', CGI.escape(agent_rule_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'CloudWorkloadSecurityAgentRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :get_cloud_workload_security_agent_rule,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#get_cloud_workload_security_agent_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all Cloud Workload Security Agent rules.
    #
    # @see #list_cloud_workload_security_agent_rules_with_http_info
    def list_cloud_workload_security_agent_rules(opts = {})
      data, _status_code, _headers = list_cloud_workload_security_agent_rules_with_http_info(opts)
      data
    end

    # Get all Cloud Workload Security Agent rules.
    #
    # Get the list of Agent rules.
    #
    # @param opts [Hash] the optional parameters
    # @return [Array<(CloudWorkloadSecurityAgentRulesListResponse, Integer, Hash)>] CloudWorkloadSecurityAgentRulesListResponse data, response status code and response headers
    def list_cloud_workload_security_agent_rules_with_http_info(opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.list_cloud_workload_security_agent_rules ...'
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/cloud_workload_security/agent_rules'

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
      return_type = opts[:debug_return_type] || 'CloudWorkloadSecurityAgentRulesListResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :list_cloud_workload_security_agent_rules,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Get, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#list_cloud_workload_security_agent_rules\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update a Cloud Workload Security Agent rule.
    #
    # @see #update_cloud_workload_security_agent_rule_with_http_info
    def update_cloud_workload_security_agent_rule(agent_rule_id, body, opts = {})
      data, _status_code, _headers = update_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, body, opts)
      data
    end

    # Update a Cloud Workload Security Agent rule.
    #
    # Update a specific Agent rule.
    # Returns the Agent rule object when the request is successful.
    #
    # @param agent_rule_id [String] The ID of the Agent rule.
    # @param body [CloudWorkloadSecurityAgentRuleUpdateRequest] New definition of the Agent rule.
    # @param opts [Hash] the optional parameters
    # @return [Array<(CloudWorkloadSecurityAgentRuleResponse, Integer, Hash)>] CloudWorkloadSecurityAgentRuleResponse data, response status code and response headers
    def update_cloud_workload_security_agent_rule_with_http_info(agent_rule_id, body, opts = {})

      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CloudWorkloadSecurityAPI.update_cloud_workload_security_agent_rule ...'
      end
      # verify the required parameter 'agent_rule_id' is set
      if @api_client.config.client_side_validation && agent_rule_id.nil?
        fail ArgumentError, "Missing the required parameter 'agent_rule_id' when calling CloudWorkloadSecurityAPI.update_cloud_workload_security_agent_rule"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling CloudWorkloadSecurityAPI.update_cloud_workload_security_agent_rule"
      end
      # resource path
      local_var_path = '/api/v2/security_monitoring/cloud_workload_security/agent_rules/{agent_rule_id}'.sub('{agent_rule_id}', CGI.escape(agent_rule_id.to_s).gsub('%2F', '/'))

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
      return_type = opts[:debug_return_type] || 'CloudWorkloadSecurityAgentRuleResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || [:apiKeyAuth, :appKeyAuth]

      new_options = opts.merge(
        :operation => :update_cloud_workload_security_agent_rule,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type,
        :api_version => "V2"
      )

      data, status_code, headers = @api_client.call_api(Net::HTTP::Patch, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CloudWorkloadSecurityAPI#update_cloud_workload_security_agent_rule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

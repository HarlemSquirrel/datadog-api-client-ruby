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

require 'spec_helper'
require 'json'

# Unit tests for DatadogAPIClient::V1::AWSLogsIntegrationAPI
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'AWSLogsIntegrationAPI' do
  before do
    # run before each test
    @api_instance = DatadogAPIClient::V1::AWSLogsIntegrationAPI.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of AWSLogsIntegrationAPI' do
    it 'should create an instance of AWSLogsIntegrationAPI' do
      expect(@api_instance).to be_instance_of(DatadogAPIClient::V1::AWSLogsIntegrationAPI)
    end
  end

  # unit tests for check_aws_logs_lambda_async
  # Check that an AWS Lambda Function exists
  # Test if permissions are present to add a log-forwarding triggers for the given services and AWS account. The input is the same as for Enable an AWS service log collection. Subsequent requests will always repeat the above, so this endpoint can be polled intermittently instead of blocking.  - Returns a status of &#39;created&#39; when it&#39;s checking if the Lambda exists in the account. - Returns a status of &#39;waiting&#39; while checking. - Returns a status of &#39;checked and ok&#39; if the Lambda exists. - Returns a status of &#39;error&#39; if the Lambda does not exist.
  # @param body Check AWS Log Lambda Async request body.
  # @param [Hash] opts the optional parameters
  # @return [AWSLogsAsyncResponse]
  describe 'check_aws_logs_lambda_async test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for check_aws_logs_services_async
  # Check permissions for log services
  # Test if permissions are present to add log-forwarding triggers for the given services and AWS account. Input is the same as for &#x60;EnableAWSLogServices&#x60;. Done async, so can be repeatedly polled in a non-blocking fashion until the async request completes.  - Returns a status of &#x60;created&#x60; when it&#39;s checking if the permissions exists   in the AWS account. - Returns a status of &#x60;waiting&#x60; while checking. - Returns a status of &#x60;checked and ok&#x60; if the Lambda exists. - Returns a status of &#x60;error&#x60; if the Lambda does not exist.
  # @param body Check AWS Logs Async Services request body.
  # @param [Hash] opts the optional parameters
  # @return [AWSLogsAsyncResponse]
  describe 'check_aws_logs_services_async test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_aws_lambda_arn
  # Add AWS Log Lambda ARN
  # Attach the Lambda ARN of the Lambda created for the Datadog-AWS log collection to your AWS account ID to enable log collection.
  # @param body AWS Log Lambda Async request body.
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'create_aws_lambda_arn test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_aws_lambda_arn
  # Delete an AWS Logs integration
  # Delete a Datadog-AWS logs configuration by removing the specific Lambda ARN associated with a given AWS account.
  # @param body Delete AWS Lambda ARN request body.
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'delete_aws_lambda_arn test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for enable_aws_log_services
  # Enable an AWS Logs integration
  # Enable automatic log collection for a list of services. This should be run after running &#x60;CreateAWSLambdaARN&#x60; to save the configuration.
  # @param body Enable AWS Log Services request body.
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'enable_aws_log_services test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_aws_logs_integrations
  # List all AWS Logs integrations
  # List all Datadog-AWS Logs integrations configured in your Datadog account.
  # @param [Hash] opts the optional parameters
  # @return [Array<AWSLogsListResponse>]
  describe 'list_aws_logs_integrations test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_aws_logs_services
  # Get list of AWS log ready services
  # Get the list of current AWS services that Datadog offers automatic log collection. Use returned service IDs with the services parameter for the Enable an AWS service log collection API endpoint.
  # @param [Hash] opts the optional parameters
  # @return [Array<AWSLogsListServicesResponse>]
  describe 'list_aws_logs_services test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
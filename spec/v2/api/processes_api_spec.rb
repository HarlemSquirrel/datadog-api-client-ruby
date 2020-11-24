=begin
#Datadog API V2 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for DatadogAPIClient::V2::ProcessesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ProcessesApi' do
  before do
    # run before each test
    @api_instance = DatadogAPIClient::V2::ProcessesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProcessesApi' do
    it 'should create an instance of ProcessesApi' do
      expect(@api_instance).to be_instance_of(DatadogAPIClient::V2::ProcessesApi)
    end
  end

  # unit tests for list_processes
  # Get all processes
  # Get all processes for your organization.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :search String to search processes by.
  # @option opts [String] :tags Comma-separated list of tags to filter processes by.
  # @option opts [Integer] :from Unix timestamp (number of seconds since epoch) of the start of the query window. If not provided, the start of the query window will be 15 minutes before the &#x60;to&#x60; timestamp. If neither &#x60;from&#x60; nor &#x60;to&#x60; are provided, the query window will be &#x60;[now - 15m, now]&#x60;.
  # @option opts [Integer] :to Unix timestamp (number of seconds since epoch) of the end of the query window. If not provided, the end of the query window will be 15 minutes after the &#x60;from&#x60; timestamp. If neither &#x60;from&#x60; nor &#x60;to&#x60; are provided, the query window will be &#x60;[now - 15m, now]&#x60;.
  # @option opts [Integer] :page_limit Maximum number of results returned.
  # @option opts [String] :page_cursor String to query the next page of results. This key is provided with each valid response from the API in &#x60;meta.page.after&#x60;.
  # @return [ProcessSummariesResponse]
  describe 'list_processes test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

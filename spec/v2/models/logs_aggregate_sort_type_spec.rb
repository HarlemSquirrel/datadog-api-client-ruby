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
require 'date'

# Unit tests for DatadogAPIClient::V2::LogsAggregateSortType
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe DatadogAPIClient::V2::LogsAggregateSortType do
  let(:instance) { DatadogAPIClient::V2::LogsAggregateSortType.new }

  describe 'test an instance of LogsAggregateSortType' do
    it 'should create an instance of LogsAggregateSortType' do
      expect(instance).to be_instance_of(DatadogAPIClient::V2::LogsAggregateSortType)
    end
  end
end

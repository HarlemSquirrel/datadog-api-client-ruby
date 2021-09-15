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

# Unit tests for DatadogAPIClient::V1::IPRangesAPI
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'IPRangesAPI' do
  before do
    # run before each test
    @api_instance = DatadogAPIClient::V1::IPRangesAPI.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of IPRangesAPI' do
    it 'should create an instance of IPRangesAPI' do
      expect(@api_instance).to be_instance_of(DatadogAPIClient::V1::IPRangesAPI)
    end
  end

  # unit tests for get_ip_ranges
  # List IP Ranges
  # Get information about Datadog IP ranges.
  # @param [Hash] opts the optional parameters
  # @return [IPRanges]
  describe 'get_ip_ranges test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
=begin
#Datadog API V2 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech

 Unless explicitly stated otherwise all files in this repository are licensed under the Apache-2.0 License.
 This product includes software developed at Datadog (https://www.datadoghq.com/).
 Copyright 2020-Present Datadog, Inc.

=end

require 'date'
require 'time'

module DatadogAPIClient::V2
  class APIKeysSort
    CREATED_AT_ASCENDING = "created_at".freeze
    CREATED_AT_DESCENDING = "-created_at".freeze
    LAST4_ASCENDING = "last4".freeze
    LAST4_DESCENDING = "-last4".freeze
    MODIFIED_AT_ASCENDING = "modified_at".freeze
    MODIFIED_AT_DESCENDING = "-modified_at".freeze
    NAME_ASCENDING = "name".freeze
    NAME_DESCENDING = "-name".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = APIKeysSort.constants.select { |c| APIKeysSort::const_get(c) == value }
      constantValues.empty? ? DatadogAPIClient::V2::UnparsedObject.new(value) : value
    end
  end
end
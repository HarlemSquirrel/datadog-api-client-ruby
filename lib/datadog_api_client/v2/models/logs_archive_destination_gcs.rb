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
require 'time'

module DatadogAPIClient::V2
  # The GCS archive destination.
  class LogsArchiveDestinationGCS
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The bucket where the archive will be stored.
    attr_accessor :bucket

    # The GCS archive's integration destination.
    attr_accessor :integration

    # The archive path.
    attr_accessor :path

    # Type of the GCS archive destination.
    attr_accessor :type

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'bucket' => :'bucket',
        :'integration' => :'integration',
        :'path' => :'path',
        :'type' => :'type'
      }
    end

    # Returns all the JSON keys this model knows about
    # @!visibility private
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    # @!visibility private
    def self.openapi_types
      {
        :'bucket' => :'String',
        :'integration' => :'LogsArchiveIntegrationGCS',
        :'path' => :'String',
        :'type' => :'LogsArchiveDestinationGCSType'
      }
    end

    # List of attributes with nullable: true
    # @!visibility private
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::LogsArchiveDestinationGCS` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V2::LogsArchiveDestinationGCS`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'bucket')
        self.bucket = attributes[:'bucket']
      end

      if attributes.key?(:'integration')
        self.integration = attributes[:'integration']
      end

      if attributes.key?(:'path')
        self.path = attributes[:'path']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if @bucket.nil?
      return false if @integration.nil?
      return false if @type.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param bucket [Object] Object to be assigned
    # @!visibility private
    def bucket=(bucket)
      if bucket.nil?
        fail ArgumentError, 'invalid value for "bucket", bucket cannot be nil.'
      end
      @bucket = bucket
    end

    # Custom attribute writer method with validation
    # @param integration [Object] Object to be assigned
    # @!visibility private
    def integration=(integration)
      if integration.nil?
        fail ArgumentError, 'invalid value for "integration", integration cannot be nil.'
      end
      @integration = integration
    end

    # Custom attribute writer method with validation
    # @param type [Object] Object to be assigned
    # @!visibility private
    def type=(type)
      if type.nil?
        fail ArgumentError, 'invalid value for "type", type cannot be nil.'
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          bucket == o.bucket &&
          integration == o.integration &&
          path == o.path &&
          type == o.type
    end

    # @see the `==` method
    # @param o [Object] Object to be compared
    # @!visibility private
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    # @!visibility private
    def hash
      [bucket, integration, path, type].hash
    end
  end
end

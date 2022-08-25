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

require 'date'
require 'time'

module DatadogAPIClient::V1
  # Create, edit, and disable users.
  class User
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # The access role of the user. Options are **st** (standard user), **adm** (admin user), or **ro** (read-only user).
    attr_accessor :access_role

    # The new disabled status of the user.
    attr_accessor :disabled

    # The new email of the user.
    attr_accessor :email

    # The user handle, must be a valid email.
    attr_accessor :handle

    # Gravatar icon associated to the user.
    attr_accessor :icon

    # The name of the user.
    attr_accessor :name

    # Whether or not the user logged in Datadog at least once.
    attr_accessor :verified

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'access_role' => :'access_role',
        :'disabled' => :'disabled',
        :'email' => :'email',
        :'handle' => :'handle',
        :'icon' => :'icon',
        :'name' => :'name',
        :'verified' => :'verified'
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
        :'access_role' => :'AccessRole',
        :'disabled' => :'Boolean',
        :'email' => :'String',
        :'handle' => :'String',
        :'icon' => :'String',
        :'name' => :'String',
        :'verified' => :'Boolean'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::User` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::User`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'access_role')
        self.access_role = attributes[:'access_role']
      end

      if attributes.key?(:'disabled')
        self.disabled = attributes[:'disabled']
      end

      if attributes.key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.key?(:'handle')
        self.handle = attributes[:'handle']
      end

      if attributes.key?(:'icon')
        self.icon = attributes[:'icon']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'verified')
        self.verified = attributes[:'verified']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          access_role == o.access_role &&
          disabled == o.disabled &&
          email == o.email &&
          handle == o.handle &&
          icon == o.icon &&
          name == o.name &&
          verified == o.verified
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
      [access_role, disabled, email, handle, icon, name, verified].hash
    end
  end
end

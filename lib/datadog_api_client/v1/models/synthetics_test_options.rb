=begin
#Datadog API V1 Collection

#Collection of all Datadog Public endpoints.

The version of the OpenAPI document: 1.0
Contact: support@datadoghq.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module DatadogAPIClient::V1
  # Object describing the extra options for a Synthetic test.
  class SyntheticsTestOptions
    # For SSL test, whether or not the test should allow self signed certificates.
    attr_accessor :accept_self_signed

    # Allows loading insecure content for an HTTP request.
    attr_accessor :allow_insecure

    # For browser test, array with the different device IDs used to run the test.
    attr_accessor :device_ids

    # For API HTTP test, whether or not the test should follow redirects.
    attr_accessor :follow_redirects

    # Minimum amount of time in failure required to trigger an alert.
    attr_accessor :min_failure_duration

    # Minimum number of locations in failure required to trigger an alert.
    attr_accessor :min_location_failed

    attr_accessor :monitor_options

    attr_accessor :_retry

    attr_accessor :tick_every

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'accept_self_signed' => :'accept_self_signed',
        :'allow_insecure' => :'allow_insecure',
        :'device_ids' => :'device_ids',
        :'follow_redirects' => :'follow_redirects',
        :'min_failure_duration' => :'min_failure_duration',
        :'min_location_failed' => :'min_location_failed',
        :'monitor_options' => :'monitor_options',
        :'_retry' => :'retry',
        :'tick_every' => :'tick_every'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'accept_self_signed' => :'Boolean',
        :'allow_insecure' => :'Boolean',
        :'device_ids' => :'Array<SyntheticsDeviceID>',
        :'follow_redirects' => :'Boolean',
        :'min_failure_duration' => :'Integer',
        :'min_location_failed' => :'Integer',
        :'monitor_options' => :'SyntheticsTestOptionsMonitorOptions',
        :'_retry' => :'SyntheticsTestOptionsRetry',
        :'tick_every' => :'SyntheticsTickInterval'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::SyntheticsTestOptions` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::SyntheticsTestOptions`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'accept_self_signed')
        self.accept_self_signed = attributes[:'accept_self_signed']
      end

      if attributes.key?(:'allow_insecure')
        self.allow_insecure = attributes[:'allow_insecure']
      end

      if attributes.key?(:'device_ids')
        if (value = attributes[:'device_ids']).is_a?(Array)
          self.device_ids = value
        end
      end

      if attributes.key?(:'follow_redirects')
        self.follow_redirects = attributes[:'follow_redirects']
      end

      if attributes.key?(:'min_failure_duration')
        self.min_failure_duration = attributes[:'min_failure_duration']
      end

      if attributes.key?(:'min_location_failed')
        self.min_location_failed = attributes[:'min_location_failed']
      end

      if attributes.key?(:'monitor_options')
        self.monitor_options = attributes[:'monitor_options']
      end

      if attributes.key?(:'_retry')
        self._retry = attributes[:'_retry']
      end

      if attributes.key?(:'tick_every')
        self.tick_every = attributes[:'tick_every']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accept_self_signed == o.accept_self_signed &&
          allow_insecure == o.allow_insecure &&
          device_ids == o.device_ids &&
          follow_redirects == o.follow_redirects &&
          min_failure_duration == o.min_failure_duration &&
          min_location_failed == o.min_location_failed &&
          monitor_options == o.monitor_options &&
          _retry == o._retry &&
          tick_every == o.tick_every
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [accept_self_signed, allow_insecure, device_ids, follow_redirects, min_failure_duration, min_location_failed, monitor_options, _retry, tick_every].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        DatadogAPIClient::V1.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
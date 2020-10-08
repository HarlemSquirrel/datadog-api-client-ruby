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
  # List of options associated with your monitor.
  class MonitorOptions
    attr_accessor :aggregation

    # IDs of the device the Synthetics monitor is running on.
    attr_accessor :device_ids

    # Whether or not to send a log sample when the log monitor triggers.
    attr_accessor :enable_logs_sample

    # A message to include with a re-notification. Supports the `@username` notification we allow elsewhere. Not applicable if `renotify_interval` is `None`.
    attr_accessor :escalation_message

    # Time (in seconds) to delay evaluation, as a non-negative integer. For example, if the value is set to `300` (5min), the timeframe is set to `last_5m` and the time is 7:00, the monitor evaluates data from 6:50 to 6:55. This is useful for AWS CloudWatch and other backfilled metrics to ensure the monitor always has data during evaluation.
    attr_accessor :evaluation_delay

    # A Boolean indicating whether notifications from this monitor automatically inserts its triggering tags into the title.  **Examples** - If `True`, `[Triggered on {host:h1}] Monitor Title` - If `False`, `[Triggered] Monitor Title`
    attr_accessor :include_tags

    # Whether or not the monitor is locked (only editable by creator and admins).
    attr_accessor :locked

    # How long the test should be in failure before alerting (integer, number of seconds, max 7200).
    attr_accessor :min_failure_duration

    # The minimum number of locations in failure at the same time during at least one moment in the `min_failure_duration` period (`min_location_failed` and `min_failure_duration` are part of the advanced alerting rules - integer, >= 1).
    attr_accessor :min_location_failed

    # Time (in seconds) to allow a host to boot and applications to fully start before starting the evaluation of monitor results. Should be a non negative integer.
    attr_accessor :new_host_delay

    # The number of minutes before a monitor notifies after data stops reporting. Datadog recommends at least 2x the monitor timeframe for metric alerts or 2 minutes for service checks. If omitted, 2x the evaluation timeframe is used for metric alerts, and 24 hours is used for service checks.
    attr_accessor :no_data_timeframe

    # A Boolean indicating whether tagged users is notified on changes to this monitor.
    attr_accessor :notify_audit

    # A Boolean indicating whether this monitor notifies when data stops reporting.
    attr_accessor :notify_no_data

    # The number of minutes after the last notification before a monitor re-notifies on the current status. It only re-notifies if it’s not resolved.
    attr_accessor :renotify_interval

    # A Boolean indicating whether this monitor needs a full window of data before it’s evaluated. We highly recommend you set this to `false` for sparse metrics, otherwise some evaluations are skipped. For “on average” “at all times” and “in total” aggregation, default is true. `False` otherwise.
    attr_accessor :require_full_window

    # Information about the downtime applied to the monitor.
    attr_accessor :silenced

    # ID of the corresponding Synthetic check.
    attr_accessor :synthetics_check_id

    attr_accessor :threshold_windows

    attr_accessor :thresholds

    # The number of hours of the monitor not reporting data before it automatically resolves from a triggered state.
    attr_accessor :timeout_h

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'aggregation' => :'aggregation',
        :'device_ids' => :'device_ids',
        :'enable_logs_sample' => :'enable_logs_sample',
        :'escalation_message' => :'escalation_message',
        :'evaluation_delay' => :'evaluation_delay',
        :'include_tags' => :'include_tags',
        :'locked' => :'locked',
        :'min_failure_duration' => :'min_failure_duration',
        :'min_location_failed' => :'min_location_failed',
        :'new_host_delay' => :'new_host_delay',
        :'no_data_timeframe' => :'no_data_timeframe',
        :'notify_audit' => :'notify_audit',
        :'notify_no_data' => :'notify_no_data',
        :'renotify_interval' => :'renotify_interval',
        :'require_full_window' => :'require_full_window',
        :'silenced' => :'silenced',
        :'synthetics_check_id' => :'synthetics_check_id',
        :'threshold_windows' => :'threshold_windows',
        :'thresholds' => :'thresholds',
        :'timeout_h' => :'timeout_h'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'aggregation' => :'MonitorOptionsAggregation',
        :'device_ids' => :'Array<MonitorDeviceID>',
        :'enable_logs_sample' => :'Boolean',
        :'escalation_message' => :'String',
        :'evaluation_delay' => :'Integer',
        :'include_tags' => :'Boolean',
        :'locked' => :'Boolean',
        :'min_failure_duration' => :'Integer',
        :'min_location_failed' => :'Integer',
        :'new_host_delay' => :'Integer',
        :'no_data_timeframe' => :'Integer',
        :'notify_audit' => :'Boolean',
        :'notify_no_data' => :'Boolean',
        :'renotify_interval' => :'Integer',
        :'require_full_window' => :'Boolean',
        :'silenced' => :'Hash<String, Integer>',
        :'synthetics_check_id' => :'Integer',
        :'threshold_windows' => :'MonitorThresholdWindowOptions',
        :'thresholds' => :'MonitorThresholds',
        :'timeout_h' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'evaluation_delay',
        :'min_failure_duration',
        :'min_location_failed',
        :'new_host_delay',
        :'no_data_timeframe',
        :'renotify_interval',
        :'synthetics_check_id',
        :'timeout_h'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V1::MonitorOptions` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V1::MonitorOptions`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'aggregation')
        self.aggregation = attributes[:'aggregation']
      end

      if attributes.key?(:'device_ids')
        if (value = attributes[:'device_ids']).is_a?(Array)
          self.device_ids = value
        end
      end

      if attributes.key?(:'enable_logs_sample')
        self.enable_logs_sample = attributes[:'enable_logs_sample']
      end

      if attributes.key?(:'escalation_message')
        self.escalation_message = attributes[:'escalation_message']
      else
        self.escalation_message = 'none'
      end

      if attributes.key?(:'evaluation_delay')
        self.evaluation_delay = attributes[:'evaluation_delay']
      end

      if attributes.key?(:'include_tags')
        self.include_tags = attributes[:'include_tags']
      else
        self.include_tags = true
      end

      if attributes.key?(:'locked')
        self.locked = attributes[:'locked']
      end

      if attributes.key?(:'min_failure_duration')
        self.min_failure_duration = attributes[:'min_failure_duration']
      else
        self.min_failure_duration = 0
      end

      if attributes.key?(:'min_location_failed')
        self.min_location_failed = attributes[:'min_location_failed']
      else
        self.min_location_failed = 1
      end

      if attributes.key?(:'new_host_delay')
        self.new_host_delay = attributes[:'new_host_delay']
      else
        self.new_host_delay = 300
      end

      if attributes.key?(:'no_data_timeframe')
        self.no_data_timeframe = attributes[:'no_data_timeframe']
      end

      if attributes.key?(:'notify_audit')
        self.notify_audit = attributes[:'notify_audit']
      else
        self.notify_audit = false
      end

      if attributes.key?(:'notify_no_data')
        self.notify_no_data = attributes[:'notify_no_data']
      else
        self.notify_no_data = false
      end

      if attributes.key?(:'renotify_interval')
        self.renotify_interval = attributes[:'renotify_interval']
      end

      if attributes.key?(:'require_full_window')
        self.require_full_window = attributes[:'require_full_window']
      else
        self.require_full_window = true
      end

      if attributes.key?(:'silenced')
        if (value = attributes[:'silenced']).is_a?(Hash)
          self.silenced = value
        end
      end

      if attributes.key?(:'synthetics_check_id')
        self.synthetics_check_id = attributes[:'synthetics_check_id']
      end

      if attributes.key?(:'threshold_windows')
        self.threshold_windows = attributes[:'threshold_windows']
      end

      if attributes.key?(:'thresholds')
        self.thresholds = attributes[:'thresholds']
      end

      if attributes.key?(:'timeout_h')
        self.timeout_h = attributes[:'timeout_h']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@min_failure_duration.nil? && @min_failure_duration > 7200
        invalid_properties.push('invalid value for "min_failure_duration", must be smaller than or equal to 7200.')
      end

      if !@min_failure_duration.nil? && @min_failure_duration < 0
        invalid_properties.push('invalid value for "min_failure_duration", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@min_failure_duration.nil? && @min_failure_duration > 7200
      return false if !@min_failure_duration.nil? && @min_failure_duration < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] min_failure_duration Value to be assigned
    def min_failure_duration=(min_failure_duration)
      if !min_failure_duration.nil? && min_failure_duration > 7200
        fail ArgumentError, 'invalid value for "min_failure_duration", must be smaller than or equal to 7200.'
      end

      if !min_failure_duration.nil? && min_failure_duration < 0
        fail ArgumentError, 'invalid value for "min_failure_duration", must be greater than or equal to 0.'
      end

      @min_failure_duration = min_failure_duration
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          aggregation == o.aggregation &&
          device_ids == o.device_ids &&
          enable_logs_sample == o.enable_logs_sample &&
          escalation_message == o.escalation_message &&
          evaluation_delay == o.evaluation_delay &&
          include_tags == o.include_tags &&
          locked == o.locked &&
          min_failure_duration == o.min_failure_duration &&
          min_location_failed == o.min_location_failed &&
          new_host_delay == o.new_host_delay &&
          no_data_timeframe == o.no_data_timeframe &&
          notify_audit == o.notify_audit &&
          notify_no_data == o.notify_no_data &&
          renotify_interval == o.renotify_interval &&
          require_full_window == o.require_full_window &&
          silenced == o.silenced &&
          synthetics_check_id == o.synthetics_check_id &&
          threshold_windows == o.threshold_windows &&
          thresholds == o.thresholds &&
          timeout_h == o.timeout_h
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [aggregation, device_ids, enable_logs_sample, escalation_message, evaluation_delay, include_tags, locked, min_failure_duration, min_location_failed, new_host_delay, no_data_timeframe, notify_audit, notify_no_data, renotify_interval, require_full_window, silenced, synthetics_check_id, threshold_windows, thresholds, timeout_h].hash
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
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        elsif attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
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
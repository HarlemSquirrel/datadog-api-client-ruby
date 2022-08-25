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
  # Attributes for the dashboard report schema used to create a dashboard report.
  class DashboardReportCreateAttributes
    include BaseGenericModel

    # Whether the object has unparsed attributes
    # @!visibility private
    attr_accessor :_unparsed

    # Description of the report in both the user interface and as part of the email body for each report sent. Must be a UTF-8 encoded string less than 4 KiB in size.
    attr_accessor :description

    # Report destination-specific configuration. This determines how reports are sent. Only email destinations are supported.
    attr_accessor :destinations

    # Report schedule-specific configuration that defines when and how often a report is sent.
    attr_accessor :schedule

    # Template variables used to parameterize the dashboard when generating a report.
    attr_accessor :template_variables

    # Time period covered by the widgets in the dashboard report, at the time of report generation.
    attr_accessor :timeframe

    # Title of the report in both the user interface, and as part of the email subject for each report sent.
    attr_accessor :title

    # Attribute mapping from ruby-style variable name to JSON key.
    # @!visibility private
    def self.attribute_map
      {
        :'description' => :'description',
        :'destinations' => :'destinations',
        :'schedule' => :'schedule',
        :'template_variables' => :'template_variables',
        :'timeframe' => :'timeframe',
        :'title' => :'title'
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
        :'description' => :'String',
        :'destinations' => :'DashboardReportDestination',
        :'schedule' => :'DashboardReportSchedule',
        :'template_variables' => :'Hash<String, String>',
        :'timeframe' => :'DashboardReportTimeframe',
        :'title' => :'String'
      }
    end

    # List of attributes with nullable: true
    # @!visibility private
    def self.openapi_nullable
      Set.new([
        :'description',
      ])
    end

    # Initializes the object
    # @param attributes [Hash] Model attributes in the form of hash
    # @!visibility private
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DatadogAPIClient::V2::DashboardReportCreateAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `DatadogAPIClient::V2::DashboardReportCreateAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'destinations')
        self.destinations = attributes[:'destinations']
      end

      if attributes.key?(:'schedule')
        self.schedule = attributes[:'schedule']
      end

      if attributes.key?(:'template_variables')
        self.template_variables = attributes[:'template_variables']
      end

      if attributes.key?(:'timeframe')
        self.timeframe = attributes[:'timeframe']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    # @!visibility private
    def valid?
      return false if !@description.nil? && @description.to_s.length > 4096
      return false if @destinations.nil?
      return false if @schedule.nil?
      return false if @timeframe.nil?
      return false if @title.nil?
      return false if @title.to_s.length > 78
      return false if @title.to_s.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param description [Object] Object to be assigned
    # @!visibility private
    def description=(description)
      if !description.nil? && description.to_s.length > 4096
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 4096.'
      end
      @description = description
    end

    # Custom attribute writer method with validation
    # @param destinations [Object] Object to be assigned
    # @!visibility private
    def destinations=(destinations)
      if destinations.nil?
        fail ArgumentError, 'invalid value for "destinations", destinations cannot be nil.'
      end
      @destinations = destinations
    end

    # Custom attribute writer method with validation
    # @param schedule [Object] Object to be assigned
    # @!visibility private
    def schedule=(schedule)
      if schedule.nil?
        fail ArgumentError, 'invalid value for "schedule", schedule cannot be nil.'
      end
      @schedule = schedule
    end

    # Custom attribute writer method with validation
    # @param timeframe [Object] Object to be assigned
    # @!visibility private
    def timeframe=(timeframe)
      if timeframe.nil?
        fail ArgumentError, 'invalid value for "timeframe", timeframe cannot be nil.'
      end
      @timeframe = timeframe
    end

    # Custom attribute writer method with validation
    # @param title [Object] Object to be assigned
    # @!visibility private
    def title=(title)
      if title.nil?
        fail ArgumentError, 'invalid value for "title", title cannot be nil.'
      end
      if title.to_s.length > 78
        fail ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 78.'
      end
      if title.to_s.length < 1
        fail ArgumentError, 'invalid value for "title", the character length must be great than or equal to 1.'
      end
      @title = title
    end

    # Checks equality by comparing each attribute.
    # @param o [Object] Object to be compared
    # @!visibility private
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          description == o.description &&
          destinations == o.destinations &&
          schedule == o.schedule &&
          template_variables == o.template_variables &&
          timeframe == o.timeframe &&
          title == o.title
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
      [description, destinations, schedule, template_variables, timeframe, title].hash
    end
  end
end

# Remove commander from an incident returns "OK" response

require "datadog_api_client"
DatadogAPIClient::V2.configure do |config|
  config.unstable_operations["v2.update_incident".to_sym] = true
end
api_instance = DatadogAPIClient::V2::IncidentsAPI.new

# there is a valid "incident" in the system
INCIDENT_DATA_ID = ENV["INCIDENT_DATA_ID"]

body = DatadogAPIClient::V2::IncidentUpdateRequest.new({
  data: DatadogAPIClient::V2::IncidentUpdateData.new({
    id: INCIDENT_DATA_ID,
    type: DatadogAPIClient::V2::IncidentType::INCIDENTS,
    relationships: DatadogAPIClient::V2::IncidentUpdateRelationships.new({
      commander_user: DatadogAPIClient::V2::NullableRelationshipToUser.new({
        data: nil,
      }),
    }),
  }),
})
p api_instance.update_incident(INCIDENT_DATA_ID, body)

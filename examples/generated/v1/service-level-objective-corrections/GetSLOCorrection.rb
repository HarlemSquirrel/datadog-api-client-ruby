require "datadog_api_client"

DatadogAPIClient::V1.configure do |config|
  config.unstable_operations[:get_slo_correction] = true
end

api_instance = DatadogAPIClient::V1::ServiceLevelObjectiveCorrectionsAPI.new
slo_correction_id = "slo_correction_id_example" # String | The ID of the SLO correction object.

begin
  # Get an SLO correction for an SLO
  result = api_instance.get_slo_correction(slo_correction_id)
  p result
rescue DatadogAPIClient::V1::APIError => e
  puts "Error when calling ServiceLevelObjectiveCorrectionsAPI->get_slo_correction: #{e}"
end
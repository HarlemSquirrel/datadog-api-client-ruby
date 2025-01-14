# Search for SLOs returns "OK" response

require "datadog_api_client"
DatadogAPIClient::V2.configure do |config|
  config.unstable_operations["v1.search_slo".to_sym] = true
end
api_instance = DatadogAPIClient::V1::ServiceLevelObjectivesAPI.new

# there is a valid "slo" in the system
SLO_DATA_0_NAME = ENV["SLO_DATA_0_NAME"]
opts = {
  query: SLO_DATA_0_NAME,
  page_size: 20,
  page_number: 0,
}
p api_instance.search_slo(opts)

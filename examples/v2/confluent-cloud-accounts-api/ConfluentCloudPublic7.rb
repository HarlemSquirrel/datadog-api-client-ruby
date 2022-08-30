# Get resource from Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new
p api_instance.confluent_cloud_public7("account_id", "resource_id")

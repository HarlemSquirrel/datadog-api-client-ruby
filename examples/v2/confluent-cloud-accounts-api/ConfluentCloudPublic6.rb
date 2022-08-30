# List Confluent Account resources returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new
p api_instance.confluent_cloud_public6("account_id")

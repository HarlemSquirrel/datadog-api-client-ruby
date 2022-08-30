# Delete Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new
api_instance.confluent_cloud_public5("account_id")

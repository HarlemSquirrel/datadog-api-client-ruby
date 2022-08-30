# Delete resource from Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new
api_instance.confluent_cloud_public10("account_id", "resource_id")

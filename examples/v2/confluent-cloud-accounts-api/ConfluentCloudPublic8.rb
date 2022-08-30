# Add resource to Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new

body = DatadogAPIClient::V2::ConfluentCloudResourceRequest.new({
  data: DatadogAPIClient::V2::ConfluentCloudResource.new({
    id: "resource_id_abc123",
    resource_type: "kafka",
    tags: [
      "myTag",
      "myTag2:myValue",
    ],
  }),
})
p api_instance.confluent_cloud_public8("account_id", body)

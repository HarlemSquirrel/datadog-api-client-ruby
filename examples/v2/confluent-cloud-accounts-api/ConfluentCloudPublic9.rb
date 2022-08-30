# Update resource in Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new

body = DatadogAPIClient::V2::UpdateResourceRequest.new({
  data: DatadogAPIClient::V2::UpdateResource.new({
    attributes: DatadogAPIClient::V2::UpdateResourceAttributes.new({
      resource_type: "kafka",
      tags: [
        "myTag",
        "myTag2:myValue",
      ],
    }),
    id: "resource-id-123",
    type: DatadogAPIClient::V2::UpdateResourceType::CONFLUENT_CLOUD_RESOURCES,
  }),
})
p api_instance.confluent_cloud_public9("account_id", "resource_id", body)

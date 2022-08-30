# Add Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new

body = DatadogAPIClient::V2::AddAccountRequest.new({
  data: DatadogAPIClient::V2::AddAccount.new({
    attributes: DatadogAPIClient::V2::AddAccountAttributes.new({
      api_key: "TESTAPIKEY123",
      api_secret: "test-api-secret-123",
      resources: [
        DatadogAPIClient::V2::ConfluentCloudResource.new({
          id: "resource_id_abc123",
          resource_type: "kafka",
          tags: [
            "myTag",
            "myTag2:myValue",
          ],
        }),
      ],
      tags: [
        "myTag",
        "myTag2:myValue",
      ],
    }),
    type: DatadogAPIClient::V2::AddAccountType::CONFLUENT_CLOUD_ACCOUNTS,
  }),
})
p api_instance.confluent_cloud_public3(body)

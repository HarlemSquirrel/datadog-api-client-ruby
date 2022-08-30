# Update Confluent account returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V2::ConfluentCloudAccountsAPIAPI.new

body = DatadogAPIClient::V2::UpdateAccountRequest.new({
  data: DatadogAPIClient::V2::UpdateAccount.new({
    attributes: DatadogAPIClient::V2::UpdateAccountAttributes.new({
      api_key: "TESTAPIKEY123",
      api_secret: "test-api-secret-123",
      tags: [
        "myTag",
        "myTag2:myValue",
      ],
    }),
    type: DatadogAPIClient::V2::UpdateAccountType::CONFLUENT_CLOUD_ACCOUNTS,
  }),
})
p api_instance.confluent_cloud_public4("account_id", body)

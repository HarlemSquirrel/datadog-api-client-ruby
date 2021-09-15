# DatadogAPIClient::V1::SyntheticsGlobalVariableValue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **secure** | **Boolean** | Determines if the value of the variable is hidden. | [optional] |
| **value** | **String** | Value of the global variable. When reading a global variable, the value will not be present if the variable is hidden with the &#x60;secure&#x60; property. | [optional] |

## Example

```ruby
require 'datadog_api_client/v1'

instance = DatadogAPIClient::V1::SyntheticsGlobalVariableValue.new(
  secure: null,
  value: example-value
)
```

# DatadogAPIClient::V1::OrganizationSettingsSamlAutocreateUsersDomains

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**domains** | **Array&lt;String&gt;** | List of domains where the SAML automated user creation is enabled. | [optional] 
**enabled** | **Boolean** | Whether or not the automated user creation based on SAML domain is enabled. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::OrganizationSettingsSamlAutocreateUsersDomains.new(domains: null,
                                 enabled: false)
```


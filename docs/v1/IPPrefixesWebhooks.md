# DatadogAPIClient::V1::IPPrefixesWebhooks

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prefixes_ipv4** | **Array&lt;String&gt;** | List of IPv4 prefixes. | [optional] 
**prefixes_ipv6** | **Array&lt;String&gt;** | List of IPv6 prefixes. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::IPPrefixesWebhooks.new(prefixes_ipv4: null,
                                 prefixes_ipv6: null)
```


# DatadogAPIClient::V1::UsageProfilingHour

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**avg_container_agent_count** | **Integer** | Get average number of container agents for that hour. | [optional] 
**host_count** | **Integer** | Contains the total number of profiled hosts reporting during a given hour. | [optional] 
**hour** | **DateTime** | The hour for the usage. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V1'

instance = DatadogAPIClient::V1::UsageProfilingHour.new(avg_container_agent_count: null,
                                 host_count: null,
                                 hour: null)
```


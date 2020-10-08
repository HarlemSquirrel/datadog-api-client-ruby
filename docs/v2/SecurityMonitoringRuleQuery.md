# DatadogAPIClient::V2::SecurityMonitoringRuleQuery

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**aggregation** | [**SecurityMonitoringRuleQueryAggregation**](SecurityMonitoringRuleQueryAggregation.md) |  | [optional] 
**distinct_fields** | **Array&lt;String&gt;** | Field for which the cardinality is measured. Sent as an array. | [optional] 
**group_by_fields** | **Array&lt;String&gt;** | Fields to group by. | [optional] 
**metric** | **String** | The target field to aggregate over when using the sum or max aggregations. | [optional] 
**name** | **String** | Name of the query. | [optional] 
**query** | **String** | Query to run on logs. | [optional] 

## Code Sample

```ruby
require 'DatadogAPIClient::V2'

instance = DatadogAPIClient::V2::SecurityMonitoringRuleQuery.new(aggregation: null,
                                 distinct_fields: null,
                                 group_by_fields: null,
                                 metric: null,
                                 name: null,
                                 query: null)
```


# Create a ci-tests formula and functions monitor returns "OK" response

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::MonitorsAPI.new

body = DatadogAPIClient::V1::Monitor.new({
  name: "Example-Create_a_ci_tests_formula_and_functions_monitor_returns_OK_response",
  type: DatadogAPIClient::V1::MonitorType::CI_TESTS_ALERT,
  query: 'formula("query1 / query2 * 100").last("15m") >= 0.8',
  message: "some message Notify: @hipchat-channel",
  tags: [
    "test:examplecreateacitestsformulaandfunctionsmonitorreturnsokresponse",
    "env:ci",
  ],
  priority: 3,
  options: DatadogAPIClient::V1::MonitorOptions.new({
    thresholds: DatadogAPIClient::V1::MonitorThresholds.new({
      critical: 0.8,
    }),
    variables: [
      DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinition.new({
        data_source: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventsDataSource::CI_TESTS,
        name: "query1",
        search: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinitionSearch.new({
          query: "@test.status:fail",
        }),
        indexes: [
          "*",
        ],
        compute: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinitionCompute.new({
          aggregation: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventAggregation::COUNT,
        }),
        group_by: [],
      }),
      DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinition.new({
        data_source: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventsDataSource::CI_TESTS,
        name: "query2",
        search: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinitionSearch.new({
          query: "",
        }),
        indexes: [
          "*",
        ],
        compute: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventQueryDefinitionCompute.new({
          aggregation: DatadogAPIClient::V1::MonitorFormulaAndFunctionEventAggregation::COUNT,
        }),
        group_by: [],
      }),
    ],
  }),
})
p api_instance.create_monitor(body)

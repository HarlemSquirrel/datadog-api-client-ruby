# Create a new dashboard with logs query table widget and storage parameter

require "datadog_api_client"
api_instance = DatadogAPIClient::V1::DashboardsAPI.new

body = DatadogAPIClient::V1::Dashboard.new({
  layout_type: DatadogAPIClient::V1::DashboardLayoutType::ORDERED,
  title: "Example-Create_a_new_dashboard_with_logs_query_table_widget_and_storage_parameter with query table widget and storage parameter",
  widgets: [
    DatadogAPIClient::V1::Widget.new({
      definition: DatadogAPIClient::V1::TableWidgetDefinition.new({
        type: DatadogAPIClient::V1::TableWidgetDefinitionType::QUERY_TABLE,
        requests: [
          DatadogAPIClient::V1::TableWidgetRequest.new({
            queries: [
              DatadogAPIClient::V1::FormulaAndFunctionEventQueryDefinition.new({
                data_source: DatadogAPIClient::V1::FormulaAndFunctionEventsDataSource::LOGS,
                name: "query1",
                search: DatadogAPIClient::V1::FormulaAndFunctionEventQueryDefinitionSearch.new({
                  query: "",
                }),
                indexes: [
                  "*",
                ],
                compute: DatadogAPIClient::V1::FormulaAndFunctionEventQueryDefinitionCompute.new({
                  aggregation: DatadogAPIClient::V1::FormulaAndFunctionEventAggregation::COUNT,
                }),
                group_by: [],
                storage: "online_archives",
              }),
            ],
            formulas: [
              DatadogAPIClient::V1::WidgetFormula.new({
                conditional_formats: [],
                cell_display_mode: DatadogAPIClient::V1::TableWidgetCellDisplayMode::BAR,
                formula: "query1",
                limit: DatadogAPIClient::V1::WidgetFormulaLimit.new({
                  count: 50,
                  order: DatadogAPIClient::V1::QuerySortOrder::DESC,
                }),
              }),
            ],
            response_format: DatadogAPIClient::V1::FormulaAndFunctionResponseFormat::SCALAR,
          }),
        ],
      }),
    }),
  ],
})
p api_instance.create_dashboard(body)

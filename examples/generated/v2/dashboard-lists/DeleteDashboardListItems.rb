require 'datadog_api_client'
api_instance = DatadogAPIClient::V2::DashboardListsAPI.new
dashboard_list_id = 789 # Integer | ID of the dashboard list to delete items from.
body = DatadogAPIClient::V2::DashboardListDeleteItemsRequest.new # DashboardListDeleteItemsRequest | Dashboards to delete from the dashboard list.

begin
  # Delete items from a dashboard list
  result = api_instance.delete_dashboard_list_items(dashboard_list_id, body)
  p result
rescue DatadogAPIClient::V2::APIError => e
  puts "Error when calling DashboardListsAPI->delete_dashboard_list_items: #{e}"
end
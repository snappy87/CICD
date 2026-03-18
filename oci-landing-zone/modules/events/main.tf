resource "oci_events_rule" "resource_changes" {
  compartment_id = var.compartment_id
  display_name   = var.event_rule_name
  description    = "Rule for resource changes in the compartment"
  is_enabled     = true

  condition = jsonencode({
    eventType = [
      "com.oraclecloud.virtualnetwork.createvcn",
      "com.oraclecloud.virtualnetwork.deletevcn"
    ]
  })

  actions {
    actions {
      action_type = "ONS"
      topic_id    = var.topic_id
    }
  }
}
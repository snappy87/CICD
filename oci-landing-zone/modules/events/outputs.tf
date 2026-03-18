output "event_rule_id" {
  description = "OCID of the event rule"
  value       = oci_events_rule.resource_changes.id
}
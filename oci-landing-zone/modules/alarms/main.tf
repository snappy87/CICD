resource "oci_monitoring_alarm" "high_cpu" {
  compartment_id = var.compartment_id
  display_name   = var.alarm_name
  description    = "Alarm for high CPU usage"

  query = "CpuUtilization[1m].mean() > 80"

  severity = "CRITICAL"

  destinations = [var.topic_id]

  is_enabled = true

  metric_compartment_id = var.compartment_id

  namespace = "oci_computeagent"
}
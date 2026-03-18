output "alarm_id" {
  description = "OCID of the alarm"
  value       = oci_monitoring_alarm.high_cpu.id
}
resource "oci_ons_notification_topic" "topic" {
  compartment_id = var.compartment_id
  name           = var.notification_topic_name
  description    = "Notification topic for landing zone alerts"
}
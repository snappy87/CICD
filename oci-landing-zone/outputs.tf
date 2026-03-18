output "compartment_id" {
  description = "OCID of the created compartment"
  value       = module.iam.compartment_id
}

output "vcn_id" {
  description = "OCID of the created VCN"
  value       = module.networking.vcn_id
}

output "public_subnet_id" {
  description = "OCID of the public subnet"
  value       = module.networking.public_subnet_id
}

output "private_subnet_id" {
  description = "OCID of the private subnet"
  value       = module.networking.private_subnet_id
}

output "log_group_id" {
  description = "OCID of the log group"
  value       = module.logging.log_group_id
}

output "notification_topic_id" {
  description = "OCID of the notification topic"
  value       = module.notifications.topic_id
}

output "alarm_id" {
  description = "OCID of the alarm"
  value       = module.alarms.alarm_id
}

output "bucket_name" {
  description = "Name of the object storage bucket"
  value       = module.object_storage.bucket_name
}
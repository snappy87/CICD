output "compartment_id" {
  description = "OCID of the compartment"
  value       = oci_identity_compartment.landing_zone.id
}

output "admin_group_id" {
  description = "OCID of the admin group"
  value       = oci_identity_group.admin.id
}

output "user_group_id" {
  description = "OCID of the user group"
  value       = oci_identity_group.users.id
}
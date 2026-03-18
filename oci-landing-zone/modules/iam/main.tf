resource "oci_identity_compartment" "landing_zone" {
  name           = var.compartment_name
  description    = var.compartment_description
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_group" "admin" {
  name           = var.admin_group_name
  description    = "Group for administrators"
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_group" "users" {
  name           = var.user_group_name
  description    = "Group for users"
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_policy" "admin_policy" {
  name           = "admin-policy"
  description    = "Policy for admin group"
  compartment_id = oci_identity_compartment.landing_zone.id
  statements = [
    "Allow group ${oci_identity_group.admin.name} to manage all-resources in compartment ${oci_identity_compartment.landing_zone.name}"
  ]
}

resource "oci_identity_policy" "user_policy" {
  name           = "user-policy"
  description    = "Policy for user group"
  compartment_id = oci_identity_compartment.landing_zone.id
  statements = [
    "Allow group ${oci_identity_group.users.name} to use instances in compartment ${oci_identity_compartment.landing_zone.name}",
    "Allow group ${oci_identity_group.users.name} to use volumes in compartment ${oci_identity_compartment.landing_zone.name}"
  ]
}
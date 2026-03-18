output "vcn_id" {
  description = "OCID of the VCN"
  value       = oci_core_vcn.vcn.id
}

output "public_subnet_id" {
  description = "OCID of the public subnet"
  value       = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "OCID of the private subnet"
  value       = oci_core_subnet.private_subnet.id
}
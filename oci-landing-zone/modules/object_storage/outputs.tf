output "bucket_name" {
  description = "Name of the bucket"
  value       = oci_objectstorage_bucket.bucket.name
}

output "bucket_namespace" {
  description = "Namespace of the bucket"
  value       = oci_objectstorage_bucket.bucket.namespace
}
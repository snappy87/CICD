resource "oci_logging_log_group" "log_group" {
  compartment_id = var.compartment_id
  display_name   = var.log_group_name
  description    = "Log group for landing zone"
}

resource "oci_logging_log" "vcn_flow_logs" {
  display_name = "vcn-flow-logs"
  log_group_id = oci_logging_log_group.log_group.id
  log_type     = "SERVICE"

  configuration {
    source {
      category    = "flowlogs"
      resource    = "vcn"
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }
}
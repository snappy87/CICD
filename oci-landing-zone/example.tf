# Example usage of the OCI Landing Zone module

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }
}

provider "oci" {
  region = var.region
}

variable "tenancy_ocid" {
  description = "OCID of your tenancy"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

module "landing_zone" {
  source = "./"

  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}

output "compartment_id" {
  value = module.landing_zone.compartment_id
}

output "vcn_id" {
  value = module.landing_zone.vcn_id
}
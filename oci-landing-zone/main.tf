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

module "iam" {
  source = "./modules/iam"

  tenancy_ocid            = var.tenancy_ocid
  compartment_name        = var.compartment_name
  compartment_description = var.compartment_description
  admin_group_name        = var.admin_group_name
  user_group_name         = var.user_group_name
}

module "networking" {
  source = "./modules/networking"

  compartment_id        = module.iam.compartment_id
  vcn_cidr              = var.vcn_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
}

module "logging" {
  source = "./modules/logging"

  compartment_id = module.iam.compartment_id
  log_group_name = var.log_group_name
}

module "events" {
  source = "./modules/events"

  compartment_id  = module.iam.compartment_id
  event_rule_name = var.event_rule_name
  topic_id        = module.notifications.topic_id
}

module "notifications" {
  source = "./modules/notifications"

  compartment_id         = module.iam.compartment_id
  notification_topic_name = var.notification_topic_name
}

module "alarms" {
  source = "./modules/alarms"

  compartment_id = module.iam.compartment_id
  alarm_name     = var.alarm_name
  topic_id       = module.notifications.topic_id
}

module "object_storage" {
  source = "./modules/object_storage"

  compartment_id = module.iam.compartment_id
  bucket_name    = var.bucket_name
}
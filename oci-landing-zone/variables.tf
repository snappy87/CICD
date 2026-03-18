variable "tenancy_ocid" {
  description = "OCID of the tenancy"
  type        = string
}

variable "compartment_name" {
  description = "Name of the compartment for the landing zone"
  type        = string
  default     = "landing-zone"
}

variable "compartment_description" {
  description = "Description of the compartment"
  type        = string
  default     = "Compartment for OCI Landing Zone"
}

variable "vcn_cidr" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "region" {
  description = "OCI region"
  type        = string
}

variable "admin_group_name" {
  description = "Name of the admin group"
  type        = string
  default     = "Administrators"
}

variable "user_group_name" {
  description = "Name of the user group"
  type        = string
  default     = "Users"
}

variable "log_group_name" {
  description = "Name of the log group"
  type        = string
  default     = "landing-zone-logs"
}

variable "notification_topic_name" {
  description = "Name of the notification topic"
  type        = string
  default     = "landing-zone-notifications"
}

variable "alarm_name" {
  description = "Name of the alarm"
  type        = string
  default     = "high-cpu-alarm"
}

variable "bucket_name" {
  description = "Name of the object storage bucket"
  type        = string
  default     = "landing-zone-bucket"
}

variable "event_rule_name" {
  description = "Name of the event rule"
  type        = string
  default     = "resource-changes"
}
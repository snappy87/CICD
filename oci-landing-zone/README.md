# OCI Landing Zone Terraform Module

This Terraform module creates a basic OCI (Oracle Cloud Infrastructure) landing zone with the following components:

- **IAM**: Compartment, groups (Administrators, Users), and policies
- **Networking**: VCN with public and private subnets, gateways, route tables, and security lists
- **Logging**: Log group and VCN flow logs
- **Events**: Event rule for resource changes
- **Notifications**: Notification topic
- **Alarms**: High CPU usage alarm
- **Object Storage**: Bucket for storage

## Usage

```hcl
module "landing_zone" {
  source = "./oci-landing-zone"

  tenancy_ocid = "ocid1.tenancy.oc1..example"
  region       = "us-ashburn-1"
  # Other variables as needed
}
```

## Requirements

- Terraform >= 1.0
- OCI provider >= 5.0

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| tenancy_ocid | OCID of the tenancy | `string` | n/a | yes |
| compartment_name | Name of the compartment | `string` | `"landing-zone"` | no |
| compartment_description | Description of the compartment | `string` | `"Compartment for OCI Landing Zone"` | no |
| vcn_cidr | CIDR block for the VCN | `string` | `"10.0.0.0/16"` | no |
| public_subnet_cidr | CIDR block for the public subnet | `string` | `"10.0.1.0/24"` | no |
| private_subnet_cidr | CIDR block for the private subnet | `string` | `"10.0.2.0/24"` | no |
| region | OCI region | `string` | n/a | yes |
| admin_group_name | Name of the admin group | `string` | `"Administrators"` | no |
| user_group_name | Name of the user group | `string` | `"Users"` | no |
| log_group_name | Name of the log group | `string` | `"landing-zone-logs"` | no |
| notification_topic_name | Name of the notification topic | `string` | `"landing-zone-notifications"` | no |
| alarm_name | Name of the alarm | `string` | `"high-cpu-alarm"` | no |
| bucket_name | Name of the object storage bucket | `string` | `"landing-zone-bucket"` | no |
| event_rule_name | Name of the event rule | `string` | `"resource-changes"` | no |

## Outputs

| Name | Description |
|------|-------------|
| compartment_id | OCID of the created compartment |
| vcn_id | OCID of the created VCN |
| public_subnet_id | OCID of the public subnet |
| private_subnet_id | OCID of the private subnet |
| log_group_id | OCID of the log group |
| notification_topic_id | OCID of the notification topic |
| alarm_id | OCID of the alarm |
| bucket_name | Name of the object storage bucket |

## Modules

This module consists of the following sub-modules:

- `iam`: Identity and Access Management resources
- `networking`: Networking resources (VCN, subnets, etc.)
- `logging`: Logging resources
- `events`: Event rules
- `notifications`: Notification topics
- `alarms`: Monitoring alarms
- `object_storage`: Object storage buckets
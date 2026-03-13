variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "resource_prefix" {
  description = "prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where PrivateLink endpoints will be created."
  type        = string
}

variable "workspace_security_group_ids" {
  description = "Security group IDs of the Databricks workspace for ingress rules."
  type        = list(string)
}

variable "privatelink_subnet_ids" {
  description = "Subnet IDs for PrivateLink Interface endpoints."
  type        = list(string)
}

variable "workspace_vpce_service" {
  description = "Databricks workspace VPC endpoint service name."
  type        = string
}

variable "relay_vpce_service" {
  description = "Databricks SCC relay VPC endpoint service name."
  type        = string
}

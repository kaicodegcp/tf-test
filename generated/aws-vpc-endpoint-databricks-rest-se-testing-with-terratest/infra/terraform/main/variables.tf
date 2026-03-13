variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "workspace_vpce_service" {
  description = "Databricks workspace VPC endpoint service name."
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs."
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs."
  type        = list(string)
}

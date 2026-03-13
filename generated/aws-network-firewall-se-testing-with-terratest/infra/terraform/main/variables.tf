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
  description = "VPC ID for the firewall."
  type        = string
}

variable "firewall_policy_arn" {
  description = "ARN of the firewall policy."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for firewall endpoints."
  type        = list(string)
}

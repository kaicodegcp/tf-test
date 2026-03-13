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

variable "role_name" {
  description = "IAM role name to attach the policy to."
  type        = string
}

variable "policy_arn" {
  description = "ARN of the IAM policy to attach."
  type        = string
}

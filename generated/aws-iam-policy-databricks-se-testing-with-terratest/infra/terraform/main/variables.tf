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

variable "policy_document" {
  description = "JSON-encoded IAM policy document."
  type        = string
}

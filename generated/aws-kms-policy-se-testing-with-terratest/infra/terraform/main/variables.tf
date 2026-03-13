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

variable "key_id" {
  description = "ID of the KMS key to set the policy on."
  type        = string
}

variable "policy_document" {
  description = "JSON-encoded KMS key policy document."
  type        = string
}

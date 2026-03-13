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

variable "target_key_id" {
  description = "ID of the KMS key to alias."
  type        = string
}

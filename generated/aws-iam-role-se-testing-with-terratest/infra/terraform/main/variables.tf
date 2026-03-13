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

variable "assume_role_policy" {
  description = "JSON-encoded assume role (trust) policy document."
  type        = string
}

variable "description" {
  description = "Description of the IAM role."
  type        = string
  default     = "Managed by Terraform"
}

variable "inline_policy" {
  description = "JSON-encoded inline policy to attach to the role. Set to null to skip."
  type        = string
  default     = null
}

variable "managed_policy_arns" {
  description = "List of managed IAM policy ARNs to attach to the role."
  type        = list(string)
  default     = []
}

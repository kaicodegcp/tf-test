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

variable "bucket_id" {
  description = "ID of the S3 bucket to attach the policy."
  type        = string
}

variable "policy_document" {
  description = "JSON-encoded S3 bucket policy document."
  type        = string
}

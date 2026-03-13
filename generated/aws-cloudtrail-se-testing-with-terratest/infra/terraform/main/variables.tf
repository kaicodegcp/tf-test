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

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudTrail logs."
  type        = string
}

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

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudTrail logs."
  type        = string
}

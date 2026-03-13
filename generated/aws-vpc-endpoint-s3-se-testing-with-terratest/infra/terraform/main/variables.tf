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

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "route_table_ids" {
  description = "Route table IDs for the S3 Gateway endpoint."
  type        = list(string)
  default     = []
}

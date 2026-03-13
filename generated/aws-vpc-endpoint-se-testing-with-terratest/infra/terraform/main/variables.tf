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
  description = "VPC ID where endpoints will be created."
  type        = string
}

variable "route_table_ids" {
  description = "Route table IDs for the S3 Gateway endpoint."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs for Interface endpoints."
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Subnet IDs for Interface endpoints."
  type        = list(string)
  default     = []
}

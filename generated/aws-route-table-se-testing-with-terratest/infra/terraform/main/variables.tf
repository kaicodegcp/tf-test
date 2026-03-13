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
  description = "VPC ID for the route table."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the route table."
  type        = list(string)
  default     = []
}

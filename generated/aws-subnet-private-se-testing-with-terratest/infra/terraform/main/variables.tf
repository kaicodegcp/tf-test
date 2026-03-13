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

variable "vpc_id" {
  description = "VPC ID where subnet will be created."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet."
  type        = string
  default     = "us-east-1a"
}

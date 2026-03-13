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
  description = "VPC ID where the security group will be created."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
  default     = "Databricks workspace security group"
}

variable "egress_ports" {
  description = "List of egress ports for control plane communication."
  type        = list(number)
  default     = [443, 2443, 5432, 6666, 8443, 8444, 8445, 8446, 8447, 8448, 8449, 8450, 8451]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress rules."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

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

variable "subnet_id" {
  description = "Subnet ID to associate."
  type        = string
}

variable "route_table_id" {
  description = "Route table ID to associate."
  type        = string
}

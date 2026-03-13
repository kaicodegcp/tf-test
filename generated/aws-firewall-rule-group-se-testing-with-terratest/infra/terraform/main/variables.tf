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

variable "capacity" {
  description = "The maximum number of operating resources for the rule group."
  type        = number
  default     = 100
}

variable "allowed_domains" {
  description = "List of allowed domain names."
  type        = list(string)
  default     = [".databricks.com", ".amazonaws.com"]
}

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

variable "retention_in_days" {
  description = "Number of days to retain log events."
  type        = number
  default     = 30
}

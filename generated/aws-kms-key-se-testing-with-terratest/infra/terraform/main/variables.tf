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

variable "deletion_window_in_days" {
  description = "Number of days before the key is deleted."
  type        = number
  default     = 7
}

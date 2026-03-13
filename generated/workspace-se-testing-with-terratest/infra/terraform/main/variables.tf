variable "databricks_account_id" {
  description = "Databricks Account ID."
  type        = string
}

variable "workspace_name" {
  description = "Name of the Databricks workspace."
  type        = string
}

variable "aws_region" {
  description = "AWS region for the workspace."
  type        = string
}

variable "credentials_id" {
  description = "Databricks credentials configuration ID."
  type        = string
}

variable "storage_configuration_id" {
  description = "Databricks storage configuration ID."
  type        = string
}

variable "network_id" {
  description = "Databricks network configuration ID."
  type        = string
}

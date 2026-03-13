variable "databricks_account_id" {
  description = "Databricks Account ID (used by account-level MWS resources). Typically same value as env var DATABRICKS_ACCOUNT_ID."
  type        = string
}

variable "credentials_name" {
  description = "Name of the credentials configuration (account-level)."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role for Databricks cross-account access."
  type        = string
}

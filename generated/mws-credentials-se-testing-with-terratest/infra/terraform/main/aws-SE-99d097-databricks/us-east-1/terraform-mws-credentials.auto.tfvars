# Mandatory
credentials_name = "se-us-east-1-cross-account-credentials"
role_arn         = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<DATABRICKS_CROSS_ACCOUNT_ROLE_NAME>"

# Notes:
# - Replace <AWS_ACCOUNT_ID> with the actual AWS account ID.
# - Replace <DATABRICKS_CROSS_ACCOUNT_ROLE_NAME> with the IAM role name configured
#   for Databricks cross-account access.
# - databricks_account_id is provided via TF_VAR_databricks_account_id env var (see repo README).
# - Databricks account credentials must be provided via env vars (see repo README).
# - Update values above to match your SE environment standards.

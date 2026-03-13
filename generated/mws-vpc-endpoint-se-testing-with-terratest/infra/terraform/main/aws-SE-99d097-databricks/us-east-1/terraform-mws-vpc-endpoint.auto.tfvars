# Mandatory
account_id          = "<ACCOUNT_ID>"
vpc_endpoint_name   = "se-us-east-1-vpc-endpoint"
region              = "us-east-1"
aws_vpc_endpoint_id = "vpce-<VPC_ENDPOINT_ID>"
aws_account_id      = "<AWS_ACCOUNT_ID>"

# Notes:
# - databricks_account_id is provided via TF_VAR_databricks_account_id env var (see repo README).
# - Databricks account credentials must be provided via env vars (see repo README).
# - Update values above to match your SE environment standards.

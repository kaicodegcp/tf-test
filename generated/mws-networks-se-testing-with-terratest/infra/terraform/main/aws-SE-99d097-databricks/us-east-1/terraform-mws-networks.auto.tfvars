# Mandatory
account_id         = "<ACCOUNT_ID>"
network_name       = "se-us-east-1-network"
vpc_id             = "vpc-<VPC_ID>"
subnet_ids         = ["subnet-<SUBNET_ID_1>", "subnet-<SUBNET_ID_2>"]
security_group_ids = ["sg-<SECURITY_GROUP_ID>"]
vpc_endpoints      = {}

# Notes:
# - databricks_account_id is provided via TF_VAR_databricks_account_id env var (see repo README).
# - Databricks account credentials must be provided via env vars (see repo README).
# - Update values above to match your SE environment standards.

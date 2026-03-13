# Provider config intentionally relies on environment variables:
#   DATABRICKS_HOST
#   DATABRICKS_ACCOUNT_ID
#   DATABRICKS_CLIENT_ID
#   DATABRICKS_CLIENT_SECRET
#
# This keeps secrets out of tfvars and repo history.
provider "databricks" {}

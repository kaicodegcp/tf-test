# Provider config relies on environment variables:
#   AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_DEFAULT_REGION
#   DATABRICKS_HOST / DATABRICKS_ACCOUNT_ID / DATABRICKS_CLIENT_ID / DATABRICKS_CLIENT_SECRET
#
# This keeps secrets out of tfvars and repo history.
provider "aws" {
  region = var.aws_region
}

provider "databricks" {}

# Root module: Databricks MWS Credentials (Account level)
#
# Adapted from the mws-credentials module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/mws-credentials
#
# This resource creates a cross-account credential configuration that allows
# Databricks to assume an IAM role in the customer's AWS account.

resource "databricks_mws_credentials" "this" {
  # Required by newer Databricks provider versions for account-level MWS resources.
  account_id       = var.databricks_account_id
  credentials_name = var.credentials_name
  role_arn         = var.role_arn
}

# Root module: Databricks Mws Vpc Endpoint (Account level)
#
# Adapted from the mws-vpc-endpoint module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/mws-vpc-endpoint

resource "databricks_mws_vpc_endpoint" "this" {
  account_id          = var.account_id
  vpc_endpoint_name   = var.vpc_endpoint_name
  region              = var.region
  aws_vpc_endpoint_id = var.aws_vpc_endpoint_id
  aws_account_id      = var.aws_account_id
}

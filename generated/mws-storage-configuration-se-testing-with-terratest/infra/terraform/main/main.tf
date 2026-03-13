# Root module: Databricks Mws Storage Configuration (Account level)
#
# Adapted from the mws-storage-configuration module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/mws-storage-configuration

resource "databricks_mws_storage_configurations" "this" {
  account_id                 = var.account_id
  storage_configuration_name = var.storage_configuration_name
  bucket_name                = var.bucket_name
}

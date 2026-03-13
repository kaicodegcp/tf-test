# Root module: Databricks Schema (Workspace level)
#
# Adapted from the schema module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/schema

resource "databricks_schema" "this" {
  catalog_name  = var.catalog_name
  name          = var.name
  comment       = var.comment
  properties    = var.properties
  storage_root  = var.storage_root
  owner         = var.owner
  force_destroy = var.force_destroy
}

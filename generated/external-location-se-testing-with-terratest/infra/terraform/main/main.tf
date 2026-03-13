# Root module: Databricks External Location (Workspace level)
#
# Adapted from the external-location module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/external-location

resource "databricks_external_location" "this" {
  name            = var.name
  url             = var.url
  credential_name = var.credential_name
  comment         = var.comment
  owner           = var.owner
  read_only       = var.read_only
  skip_validation = var.skip_validation
  force_destroy   = var.force_destroy
  force_update    = var.force_update
  isolation_mode  = var.isolation_mode # SRA: ISOLATED by default
}

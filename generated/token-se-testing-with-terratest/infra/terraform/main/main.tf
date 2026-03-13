# Root module: Databricks Token (Workspace level)
#
# Adapted from the token module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/token

resource "databricks_token" "this" {
  comment          = var.comment
  lifetime_seconds = var.lifetime_seconds
}

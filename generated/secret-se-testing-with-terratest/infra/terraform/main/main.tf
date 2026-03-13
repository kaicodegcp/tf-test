# Root module: Databricks Secret (Workspace level)
#
# Adapted from the secret module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/secret

resource "databricks_secret" "this" {
  scope        = var.scope
  key          = var.key
  string_value = var.string_value
}

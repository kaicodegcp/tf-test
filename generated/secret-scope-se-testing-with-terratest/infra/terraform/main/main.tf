# Root module: Databricks Secret Scope (Workspace level)
#
# Adapted from the secret-scope module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/secret-scope

resource "databricks_secret_scope" "this" {
  name = var.name

  dynamic "keyvault_metadata" {
    for_each = var.keyvault_metadata != null ? [var.keyvault_metadata] : []
    content {
      resource_id = keyvault_metadata.value.resource_id
      dns_name    = keyvault_metadata.value.dns_name
    }
  }

  initial_manage_principal = var.initial_manage_principal
}

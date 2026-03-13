# Root module: Databricks Secret ACL

resource "databricks_secret_acl" "this" {
  scope      = var.scope
  principal  = var.principal
  permission = var.permission
}

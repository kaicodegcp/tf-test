# Root module: Databricks Grants

resource "databricks_grants" "this" {
  catalog = var.catalog_name

  dynamic "grant" {
    for_each = var.grants
    content {
      principal  = grant.value.principal
      privileges = grant.value.privileges
    }
  }
}

# Root module: Databricks Unity Catalog Volume

resource "databricks_volume" "this" {
  name             = var.volume_name
  catalog_name     = var.catalog_name
  schema_name      = var.schema_name
  volume_type      = var.volume_type
  storage_location = var.storage_location
}

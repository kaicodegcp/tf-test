# Root module: Databricks Node Type Data Source

data "databricks_node_type" "smallest" {
  local_disk = var.local_disk
}

# Root module: Databricks Sql Dashboard (Workspace level)
#
# Adapted from the sql-dashboard module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/sql-dashboard

resource "databricks_dashboard" "this" {
  display_name = var.name
  parent_path  = var.parent
  warehouse_id = var.warehouse_id
}

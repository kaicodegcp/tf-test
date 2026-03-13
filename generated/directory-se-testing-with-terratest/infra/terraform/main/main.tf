# Root module: Databricks Directory (Workspace level)
#
# Adapted from the directory module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/directory

resource "databricks_directory" "this" {
  path             = var.path
  delete_recursive = var.delete_recursive
  object_id        = var.object_id
}

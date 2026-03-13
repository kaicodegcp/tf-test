# Root module: Databricks Mlflow Model (Workspace level)
#
# Adapted from the mlflow-model module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/mlflow-model

resource "databricks_mlflow_model" "this" {
  name        = var.name
  description = var.description

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

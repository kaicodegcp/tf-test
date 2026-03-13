# Root module: Databricks Mlflow Experiment (Workspace level)
#
# Adapted from the mlflow-experiment module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/mlflow-experiment

resource "databricks_mlflow_experiment" "this" {
  name              = var.name
  artifact_location = var.artifact_location
  description       = var.description
}

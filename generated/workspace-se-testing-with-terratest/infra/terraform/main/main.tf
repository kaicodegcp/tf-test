# Root module: Databricks MWS Workspace

resource "databricks_mws_workspaces" "this" {
  account_id     = var.databricks_account_id
  workspace_name = var.workspace_name
  aws_region     = var.aws_region

  credentials_id           = var.credentials_id
  storage_configuration_id = var.storage_configuration_id
  network_id               = var.network_id
}

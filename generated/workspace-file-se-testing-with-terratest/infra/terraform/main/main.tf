# Root module: Databricks Workspace File

resource "databricks_workspace_file" "this" {
  path           = var.path
  content_base64 = var.content_base64
}

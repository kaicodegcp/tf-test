output "workspace_id" {
  description = "The ID of the workspace."
  value       = databricks_mws_workspaces.this.workspace_id
}

output "workspace_url" {
  description = "The URL of the workspace."
  value       = databricks_mws_workspaces.this.workspace_url
}

output "workspace_name" {
  description = "The name of the workspace."
  value       = databricks_mws_workspaces.this.workspace_name
}

output "id" {
  description = "The ID of the workspace file."
  value       = databricks_workspace_file.this.id
}

output "path" {
  description = "The path of the workspace file."
  value       = databricks_workspace_file.this.path
}

output "url" {
  description = "The URL of the workspace file."
  value       = databricks_workspace_file.this.url
}

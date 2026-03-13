output "metastore_id" {
  description = "The metastore ID."
  value       = databricks_metastore_assignment.this.metastore_id
}

output "workspace_id" {
  description = "The workspace ID."
  value       = databricks_metastore_assignment.this.workspace_id
}

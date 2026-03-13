output "node_type_id" {
  description = "The smallest node type ID."
  value       = data.databricks_node_type.smallest.id
}

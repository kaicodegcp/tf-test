output "catalog" {
  description = "The catalog the grants are applied to."
  value       = databricks_grants.this.catalog
}

output "id" {
  description = "The ID of the grants resource."
  value       = databricks_grants.this.id
}

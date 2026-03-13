output "id" {
  description = "The ID of the secret ACL."
  value       = databricks_secret_acl.this.id
}

output "scope" {
  description = "The scope of the secret ACL."
  value       = databricks_secret_acl.this.scope
}

output "principal" {
  description = "The principal of the secret ACL."
  value       = databricks_secret_acl.this.principal
}

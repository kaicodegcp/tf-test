output "volume_id" {
  description = "The ID of the volume."
  value       = databricks_volume.this.id
}

output "volume_name" {
  description = "The name of the volume."
  value       = databricks_volume.this.name
}

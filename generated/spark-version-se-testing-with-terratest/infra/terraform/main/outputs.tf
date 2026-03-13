output "spark_version" {
  description = "The latest Spark version."
  value       = data.databricks_spark_version.latest.id
}

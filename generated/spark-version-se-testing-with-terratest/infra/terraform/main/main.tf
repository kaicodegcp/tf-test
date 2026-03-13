# Root module: Databricks Spark Version Data Source

data "databricks_spark_version" "latest" {
  long_term_support = var.long_term_support
}

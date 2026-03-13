# Mandatory
cluster_name     = "se-us-east-1-test-cluster"
spark_version    = "13.3.x-scala2.12"
node_type_id     = "i3.xlarge"
autoscale        = {}
aws_attributes   = {}
init_scripts     = []
libraries        = []
cluster_log_conf = {}
docker_image     = {}
workload_type    = {}

# Notes:
# - Databricks account credentials must be provided via env vars (see repo README).
# - Update values above to match your SE environment standards.

# spark_version Terratest

This suite runs Terraform against the root module:

- `infra/terraform/main`

and uses the SE example tfvars:

- `infra/terraform/main/aws-SE-99d097-databricks/us-east-1/terraform-spark-version.auto.tfvars`

## Prereqs

- Go >= 1.21
- Terraform available in PATH
- Databricks **Account** auth exported as env vars:

```bash
export DATABRICKS_HOST="https://accounts.cloud.databricks.com"
export DATABRICKS_ACCOUNT_ID="<account-id>"
export DATABRICKS_CLIENT_ID="<sp-client-id>"
export DATABRICKS_CLIENT_SECRET="<sp-client-secret>"
```

## Run

From repo root:

```bash
cd test/terratest/spark_version
./test.sh
```

Reports are written to `test-reports/`.

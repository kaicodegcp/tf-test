# complete_workspace Terratest

This suite runs Terraform against the root module:

- `infra/terraform/main`

and uses the SE example tfvars:

- `infra/terraform/main/aws-SE-99d097-databricks/us-east-1/terraform-complete-workspace.auto.tfvars`

## Prereqs

- Go >= 1.21
- Terraform available in PATH
- AWS credentials exported as env vars:

```bash
export AWS_ACCESS_KEY_ID="<key>"
export AWS_SECRET_ACCESS_KEY="<secret>"
export AWS_DEFAULT_REGION="us-east-1"
```
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
cd test/terratest/complete_workspace
./test.sh
```

Reports are written to `test-reports/`.

# mws-vpc-endpoint (SE testing)

This repo follows the standard hierarchy used by the `dbx-platform` test repos:

- `infra/terraform/main` : Terraform root module
- `infra/terraform/main/aws-SE-*/<region>` : environment/region specific `*.auto.tfvars`

## Prereqs

- Terraform >= 1.0
- Databricks Terraform provider available (declared in `versions.tf`)
- Databricks **Account-level** authentication exported as environment variables (preferred pattern):

```bash
export DATABRICKS_HOST="https://accounts.cloud.databricks.com"
export DATABRICKS_ACCOUNT_ID="<your-account-id>"
export DATABRICKS_CLIENT_ID="<sp-client-id>"
export DATABRICKS_CLIENT_SECRET="<sp-client-secret>"

# Some Databricks provider versions require account_id to be passed as a Terraform variable
# for account-level MWS resources. This wires it automatically from the same value:
export TF_VAR_databricks_account_id="$DATABRICKS_ACCOUNT_ID"
```

> No secrets are stored in this repo. Credentials are expected via env vars.

## Run (SE / us-east-1 example)

From repo root:

```bash
cd infra/terraform/main

# Validate
terraform fmt -recursive
terraform init

# Plan/apply using the env tfvars file
terraform plan  -var-file="aws-SE-99d097-databricks/us-east-1/terraform-mws-vpc-endpoint.auto.tfvars"
terraform apply -var-file="aws-SE-99d097-databricks/us-east-1/terraform-mws-vpc-endpoint.auto.tfvars"
```

## What it creates

- Databricks account-level **MWS VPC Endpoint**:
  - `databricks_mws_vpc_endpoint`

## Cleanup

```bash
cd infra/terraform/main
terraform destroy -var-file="aws-SE-99d097-databricks/us-east-1/terraform-mws-vpc-endpoint.auto.tfvars"
```


## Terratest

Terratest suites are under `test/terratest/`. See `test/terratest/README.md` for how to run.

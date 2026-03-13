# aws_internet_gateway Terratest

This suite runs Terraform against the root module:

- `infra/terraform/main`

and uses the SE example tfvars:

- `infra/terraform/main/aws-SE-99d097-databricks/us-east-1/terraform-aws-internet-gateway.auto.tfvars`

## Prereqs

- Go >= 1.21
- Terraform available in PATH
- AWS credentials exported as env vars:

```bash
export AWS_ACCESS_KEY_ID="<key>"
export AWS_SECRET_ACCESS_KEY="<secret>"
export AWS_DEFAULT_REGION="us-east-1"
```

## Run

From repo root:

```bash
cd test/terratest/aws_internet_gateway
./test.sh
```

Reports are written to `test-reports/`.

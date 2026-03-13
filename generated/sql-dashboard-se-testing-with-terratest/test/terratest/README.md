# Terratest Suites

This folder contains Go (Terratest) test suites for this repo.

- `sql_dashboard/` : Validates the Databricks **Sql Dashboard** Terraform code in `infra/terraform/main`.

> These tests are typically executed manually from an EC2/runner that has AWS access and Databricks Account credentials exported as environment variables.

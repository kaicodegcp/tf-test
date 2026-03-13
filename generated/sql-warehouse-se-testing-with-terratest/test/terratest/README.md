# Terratest Suites

This folder contains Go (Terratest) test suites for this repo.

- `sql_warehouse/` : Validates the Databricks **Sql Warehouse** Terraform code in `infra/terraform/main`.

> These tests are typically executed manually from an EC2/runner that has AWS access and Databricks Account credentials exported as environment variables.

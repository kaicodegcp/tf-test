package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamRoleDatabricksCrossAccount_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_iam_role_databricks_cross_account
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-iam-role-databricks-cross-account.auto.tfvars")

	opts := &terraform.Options{
		TerraformDir: terraformDir,
		VarFiles:     []string{varFile},
		NoColor:      true,
	}

	// Destroy unless KEEP_RESOURCES=true (defer early so we clean up on test failures too)
	if os.Getenv("KEEP_RESOURCES") != "true" {
		defer terraform.Destroy(t, opts)
	}

	// Apply
	terraform.InitAndApply(t, opts)

	// Basic output validation
	role_arn := terraform.Output(t, opts, "role_arn")
	require.NotEmpty(t, role_arn)
	role_name := terraform.Output(t, opts, "role_name")
	require.NotEmpty(t, role_name)
	role_id := terraform.Output(t, opts, "role_id")
	require.NotEmpty(t, role_id)
	account_id := terraform.Output(t, opts, "account_id")
	require.NotEmpty(t, account_id)
}

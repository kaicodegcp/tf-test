package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestCompleteWorkspace_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/complete_workspace
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-complete-workspace.auto.tfvars")

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
	vpc_id := terraform.Output(t, opts, "vpc_id")
	require.NotEmpty(t, vpc_id)
	security_group_id := terraform.Output(t, opts, "security_group_id")
	require.NotEmpty(t, security_group_id)
	s3_bucket_name := terraform.Output(t, opts, "s3_bucket_name")
	require.NotEmpty(t, s3_bucket_name)
	iam_role_arn := terraform.Output(t, opts, "iam_role_arn")
	require.NotEmpty(t, iam_role_arn)
}

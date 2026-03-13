package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamPolicyWorkspace_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_iam_policy_workspace
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-iam-policy-workspace.auto.tfvars")

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
	policy_arn := terraform.Output(t, opts, "policy_arn")
	require.NotEmpty(t, policy_arn)
	policy_name := terraform.Output(t, opts, "policy_name")
	require.NotEmpty(t, policy_name)
	policy_id := terraform.Output(t, opts, "policy_id")
	require.NotEmpty(t, policy_id)
}

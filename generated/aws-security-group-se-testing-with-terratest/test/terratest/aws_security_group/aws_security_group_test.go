package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsSecurityGroup_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_security_group
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-security-group.auto.tfvars")

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
	security_group_id := terraform.Output(t, opts, "security_group_id")
	require.NotEmpty(t, security_group_id)
	security_group_arn := terraform.Output(t, opts, "security_group_arn")
	require.NotEmpty(t, security_group_arn)
	security_group_name := terraform.Output(t, opts, "security_group_name")
	require.NotEmpty(t, security_group_name)
}

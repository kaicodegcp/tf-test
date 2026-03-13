package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsKmsAlias_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_kms_alias
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-kms-alias.auto.tfvars")

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
	alias_arn := terraform.Output(t, opts, "alias_arn")
	require.NotEmpty(t, alias_arn)
	alias_name := terraform.Output(t, opts, "alias_name")
	require.NotEmpty(t, alias_name)
	target_key_arn := terraform.Output(t, opts, "target_key_arn")
	require.NotEmpty(t, target_key_arn)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsCloudwatchLogGroup_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_cloudwatch_log_group
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-cloudwatch-log-group.auto.tfvars")

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
	log_group_name := terraform.Output(t, opts, "log_group_name")
	require.NotEmpty(t, log_group_name)
	log_group_arn := terraform.Output(t, opts, "log_group_arn")
	require.NotEmpty(t, log_group_arn)
}

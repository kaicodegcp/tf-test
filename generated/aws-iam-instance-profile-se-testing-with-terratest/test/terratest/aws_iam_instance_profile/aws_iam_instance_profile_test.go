package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamInstanceProfile_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_iam_instance_profile
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-iam-instance-profile.auto.tfvars")

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
	instance_profile_arn := terraform.Output(t, opts, "instance_profile_arn")
	require.NotEmpty(t, instance_profile_arn)
	instance_profile_name := terraform.Output(t, opts, "instance_profile_name")
	require.NotEmpty(t, instance_profile_name)
	instance_profile_id := terraform.Output(t, opts, "instance_profile_id")
	require.NotEmpty(t, instance_profile_id)
}

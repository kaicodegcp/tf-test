package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsS3BucketRoot_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_s3_bucket_root
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-s3-bucket-root.auto.tfvars")

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
	bucket_id := terraform.Output(t, opts, "bucket_id")
	require.NotEmpty(t, bucket_id)
	bucket_arn := terraform.Output(t, opts, "bucket_arn")
	require.NotEmpty(t, bucket_arn)
	bucket_name := terraform.Output(t, opts, "bucket_name")
	require.NotEmpty(t, bucket_name)
}

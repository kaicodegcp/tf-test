package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsS3Bucket_SE_UsEast1(t *testing.T) {
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "infra", "terraform", "main"))

	opts := &terraform.Options{
		TerraformDir: terraformDir,
		NoColor:      true,
	}

	if os.Getenv("KEEP_RESOURCES") != "true" {
		defer terraform.Destroy(t, opts)
	}

	terraform.InitAndApply(t, opts)

	bucketID := terraform.Output(t, opts, "bucket_id")
	bucketArn := terraform.Output(t, opts, "bucket_arn")
	bucketName := terraform.Output(t, opts, "bucket_name")
	bucketDomain := terraform.Output(t, opts, "bucket_domain_name")

	require.NotEmpty(t, bucketID)
	require.NotEmpty(t, bucketArn)
	require.NotEmpty(t, bucketName)
	require.NotEmpty(t, bucketDomain)
}

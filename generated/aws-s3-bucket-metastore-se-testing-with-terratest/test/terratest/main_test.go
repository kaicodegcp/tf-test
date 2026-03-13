package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsS3BucketMetastore_SE_UsEast1(t *testing.T) {
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

	bucket_idVal := terraform.Output(t, opts, "bucket_id")
	require.NotEmpty(t, bucket_idVal)
	bucket_arnVal := terraform.Output(t, opts, "bucket_arn")
	require.NotEmpty(t, bucket_arnVal)
	bucket_nameVal := terraform.Output(t, opts, "bucket_name")
	require.NotEmpty(t, bucket_nameVal)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestCompleteWorkspace_SE_UsEast1(t *testing.T) {
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

	vpc_idVal := terraform.Output(t, opts, "vpc_id")
	require.NotEmpty(t, vpc_idVal)
	security_group_idVal := terraform.Output(t, opts, "security_group_id")
	require.NotEmpty(t, security_group_idVal)
	s3_bucket_nameVal := terraform.Output(t, opts, "s3_bucket_name")
	require.NotEmpty(t, s3_bucket_nameVal)
	iam_role_arnVal := terraform.Output(t, opts, "iam_role_arn")
	require.NotEmpty(t, iam_role_arnVal)
}

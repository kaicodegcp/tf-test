package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamInstanceProfile_SE_UsEast1(t *testing.T) {
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

	instance_profile_arnVal := terraform.Output(t, opts, "instance_profile_arn")
	require.NotEmpty(t, instance_profile_arnVal)
	instance_profile_nameVal := terraform.Output(t, opts, "instance_profile_name")
	require.NotEmpty(t, instance_profile_nameVal)
	instance_profile_idVal := terraform.Output(t, opts, "instance_profile_id")
	require.NotEmpty(t, instance_profile_idVal)
}

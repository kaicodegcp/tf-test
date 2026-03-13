package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamPolicyDatabricks_SE_UsEast1(t *testing.T) {
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

	policy_arnVal := terraform.Output(t, opts, "policy_arn")
	require.NotEmpty(t, policy_arnVal)
	policy_nameVal := terraform.Output(t, opts, "policy_name")
	require.NotEmpty(t, policy_nameVal)
	policy_idVal := terraform.Output(t, opts, "policy_id")
	require.NotEmpty(t, policy_idVal)
}

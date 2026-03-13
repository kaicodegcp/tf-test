package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamRoleDatabricksCrossAccount_SE_UsEast1(t *testing.T) {
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

	role_arnVal := terraform.Output(t, opts, "role_arn")
	require.NotEmpty(t, role_arnVal)
	role_nameVal := terraform.Output(t, opts, "role_name")
	require.NotEmpty(t, role_nameVal)
	role_idVal := terraform.Output(t, opts, "role_id")
	require.NotEmpty(t, role_idVal)
	account_idVal := terraform.Output(t, opts, "account_id")
	require.NotEmpty(t, account_idVal)
}

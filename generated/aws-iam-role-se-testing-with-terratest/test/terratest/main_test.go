package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsIamRole_SE_UsEast1(t *testing.T) {
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

	roleArn := terraform.Output(t, opts, "role_arn")
	roleName := terraform.Output(t, opts, "role_name")
	roleID := terraform.Output(t, opts, "role_id")
	accountID := terraform.Output(t, opts, "account_id")

	require.NotEmpty(t, roleArn)
	require.NotEmpty(t, roleName)
	require.NotEmpty(t, roleID)
	require.NotEmpty(t, accountID)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsKmsKey_SE_UsEast1(t *testing.T) {
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

	key_idVal := terraform.Output(t, opts, "key_id")
	require.NotEmpty(t, key_idVal)
	key_arnVal := terraform.Output(t, opts, "key_arn")
	require.NotEmpty(t, key_arnVal)
	account_idVal := terraform.Output(t, opts, "account_id")
	require.NotEmpty(t, account_idVal)
}

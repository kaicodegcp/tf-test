package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsKmsAlias_SE_UsEast1(t *testing.T) {
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

	alias_arnVal := terraform.Output(t, opts, "alias_arn")
	require.NotEmpty(t, alias_arnVal)
	alias_nameVal := terraform.Output(t, opts, "alias_name")
	require.NotEmpty(t, alias_nameVal)
	target_key_arnVal := terraform.Output(t, opts, "target_key_arn")
	require.NotEmpty(t, target_key_arnVal)
}

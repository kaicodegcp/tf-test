package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsVpc_SE_UsEast1(t *testing.T) {
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
	vpc_arnVal := terraform.Output(t, opts, "vpc_arn")
	require.NotEmpty(t, vpc_arnVal)
	vpc_cidr_blockVal := terraform.Output(t, opts, "vpc_cidr_block")
	require.NotEmpty(t, vpc_cidr_blockVal)
}

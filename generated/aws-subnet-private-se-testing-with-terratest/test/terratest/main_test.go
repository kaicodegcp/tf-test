package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsSubnetPrivate_SE_UsEast1(t *testing.T) {
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

	subnet_idVal := terraform.Output(t, opts, "subnet_id")
	require.NotEmpty(t, subnet_idVal)
	subnet_arnVal := terraform.Output(t, opts, "subnet_arn")
	require.NotEmpty(t, subnet_arnVal)
	subnet_cidr_blockVal := terraform.Output(t, opts, "subnet_cidr_block")
	require.NotEmpty(t, subnet_cidr_blockVal)
}

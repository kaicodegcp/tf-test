package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsSubnets_SE_UsEast1(t *testing.T) {
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

	subnetIDs := terraform.OutputList(t, opts, "private_subnet_ids")
	subnetArns := terraform.OutputList(t, opts, "private_subnet_arns")
	subnetCidrs := terraform.OutputList(t, opts, "private_subnet_cidr_blocks")

	require.NotEmpty(t, subnetIDs)
	require.NotEmpty(t, subnetArns)
	require.NotEmpty(t, subnetCidrs)
}

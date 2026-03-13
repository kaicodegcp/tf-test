package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsNatGateway_SE_UsEast1(t *testing.T) {
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

	natGwID := terraform.Output(t, opts, "nat_gateway_id")
	natGwPublicIP := terraform.Output(t, opts, "nat_gateway_public_ip")
	eipID := terraform.Output(t, opts, "eip_allocation_id")

	require.NotEmpty(t, natGwID)
	require.NotEmpty(t, natGwPublicIP)
	require.NotEmpty(t, eipID)
}

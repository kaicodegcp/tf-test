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

	nat_gateway_idVal := terraform.Output(t, opts, "nat_gateway_id")
	require.NotEmpty(t, nat_gateway_idVal)
	nat_gateway_public_ipVal := terraform.Output(t, opts, "nat_gateway_public_ip")
	require.NotEmpty(t, nat_gateway_public_ipVal)
	eip_idVal := terraform.Output(t, opts, "eip_id")
	require.NotEmpty(t, eip_idVal)
}

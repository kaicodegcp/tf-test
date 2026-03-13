package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestMwsNetworks_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/mws_networks
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-mws-networks.auto.tfvars")

	opts := &terraform.Options{
		TerraformDir: terraformDir,
		VarFiles:     []string{varFile},
		NoColor:      true,
	}

	// Destroy unless KEEP_RESOURCES=true (defer early so we clean up on test failures too)
	if os.Getenv("KEEP_RESOURCES") != "true" {
		defer terraform.Destroy(t, opts)
	}

	// Apply
	terraform.InitAndApply(t, opts)

	// Basic output validation
	id := terraform.Output(t, opts, "id")
	networkId := terraform.Output(t, opts, "network_id")
	networkName := terraform.Output(t, opts, "network_name")
	vpcId := terraform.Output(t, opts, "vpc_id")

	require.NotEmpty(t, id)
	require.NotEmpty(t, networkId)
	require.NotEmpty(t, networkName)
	require.NotEmpty(t, vpcId)
}

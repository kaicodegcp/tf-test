package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsNatGateway_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_nat_gateway
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-nat-gateway.auto.tfvars")

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
	nat_gateway_id := terraform.Output(t, opts, "nat_gateway_id")
	require.NotEmpty(t, nat_gateway_id)
	nat_gateway_public_ip := terraform.Output(t, opts, "nat_gateway_public_ip")
	require.NotEmpty(t, nat_gateway_public_ip)
	eip_id := terraform.Output(t, opts, "eip_id")
	require.NotEmpty(t, eip_id)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestMwsVpcEndpoint_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/mws_vpc_endpoint
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-mws-vpc-endpoint.auto.tfvars")

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
	vpcEndpointId := terraform.Output(t, opts, "vpc_endpoint_id")
	vpcEndpointName := terraform.Output(t, opts, "vpc_endpoint_name")

	require.NotEmpty(t, id)
	require.NotEmpty(t, vpcEndpointId)
	require.NotEmpty(t, vpcEndpointName)
}

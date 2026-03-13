package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsSubnetPublic_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/aws_subnet_public
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-aws-subnet-public.auto.tfvars")

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
	subnet_id := terraform.Output(t, opts, "subnet_id")
	require.NotEmpty(t, subnet_id)
	subnet_arn := terraform.Output(t, opts, "subnet_arn")
	require.NotEmpty(t, subnet_arn)
	subnet_cidr_block := terraform.Output(t, opts, "subnet_cidr_block")
	require.NotEmpty(t, subnet_cidr_block)
}

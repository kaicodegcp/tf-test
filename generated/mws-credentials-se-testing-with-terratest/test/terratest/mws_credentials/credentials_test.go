package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestMwsCredentials_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/mws_credentials
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-mws-credentials.auto.tfvars")

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
	credentialsID := terraform.Output(t, opts, "credentials_id")
	name := terraform.Output(t, opts, "credentials_name")
	externalID := terraform.Output(t, opts, "external_id")

	require.NotEmpty(t, id)
	require.NotEmpty(t, credentialsID)
	require.NotEmpty(t, name)
	require.NotEmpty(t, externalID)
}

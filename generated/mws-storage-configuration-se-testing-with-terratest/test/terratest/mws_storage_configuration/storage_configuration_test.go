package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestMwsStorageConfiguration_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/mws_storage_configuration
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-mws-storage-configuration.auto.tfvars")

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
	storageConfigurationId := terraform.Output(t, opts, "storage_configuration_id")
	storageConfigurationName := terraform.Output(t, opts, "storage_configuration_name")

	require.NotEmpty(t, id)
	require.NotEmpty(t, storageConfigurationId)
	require.NotEmpty(t, storageConfigurationName)
}

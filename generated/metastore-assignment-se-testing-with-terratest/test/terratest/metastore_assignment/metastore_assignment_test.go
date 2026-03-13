package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestMetastoreAssignment_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/metastore_assignment
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-metastore-assignment.auto.tfvars")

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
	metastore_id := terraform.Output(t, opts, "metastore_id")
	require.NotEmpty(t, metastore_id)
	workspace_id := terraform.Output(t, opts, "workspace_id")
	require.NotEmpty(t, workspace_id)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestWorkspace_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/workspace
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-workspace.auto.tfvars")

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
	workspace_id := terraform.Output(t, opts, "workspace_id")
	require.NotEmpty(t, workspace_id)
	workspace_url := terraform.Output(t, opts, "workspace_url")
	require.NotEmpty(t, workspace_url)
	workspace_name := terraform.Output(t, opts, "workspace_name")
	require.NotEmpty(t, workspace_name)
}

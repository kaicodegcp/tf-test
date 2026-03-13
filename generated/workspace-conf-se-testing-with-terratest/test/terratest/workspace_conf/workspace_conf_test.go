package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestWorkspaceConf_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/workspace_conf
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-workspace-conf.auto.tfvars")

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
	workspaceConfId := terraform.Output(t, opts, "workspace_conf_id")
	appliedSettings := terraform.Output(t, opts, "applied_settings")
	legacyAccessDisabled := terraform.Output(t, opts, "legacy_access_disabled")
	legacyDbfsDisabled := terraform.Output(t, opts, "legacy_dbfs_disabled")

	require.NotEmpty(t, workspaceConfId)
	require.NotEmpty(t, appliedSettings)
	require.NotEmpty(t, legacyAccessDisabled)
	require.NotEmpty(t, legacyDbfsDisabled)
}

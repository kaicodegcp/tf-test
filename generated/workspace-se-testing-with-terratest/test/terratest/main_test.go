package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestWorkspace_SE_UsEast1(t *testing.T) {
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

	workspace_idVal := terraform.Output(t, opts, "workspace_id")
	require.NotEmpty(t, workspace_idVal)
	workspace_urlVal := terraform.Output(t, opts, "workspace_url")
	require.NotEmpty(t, workspace_urlVal)
	workspace_nameVal := terraform.Output(t, opts, "workspace_name")
	require.NotEmpty(t, workspace_nameVal)
}

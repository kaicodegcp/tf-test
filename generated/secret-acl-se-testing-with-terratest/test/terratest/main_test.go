package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestSecretAcl_SE_UsEast1(t *testing.T) {
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

	idVal := terraform.Output(t, opts, "id")
	require.NotEmpty(t, idVal)
	scopeVal := terraform.Output(t, opts, "scope")
	require.NotEmpty(t, scopeVal)
	principalVal := terraform.Output(t, opts, "principal")
	require.NotEmpty(t, principalVal)
}

package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsPrivateLink_SE_UsEast1(t *testing.T) {
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

	plSgID := terraform.Output(t, opts, "privatelink_sg_id")
	wsEndpointID := terraform.Output(t, opts, "workspace_endpoint_id")
	relayEndpointID := terraform.Output(t, opts, "relay_endpoint_id")

	require.NotEmpty(t, plSgID)
	require.NotEmpty(t, wsEndpointID)
	require.NotEmpty(t, relayEndpointID)
}

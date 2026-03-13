package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsVpcEndpoint_SE_UsEast1(t *testing.T) {
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

	s3EndpointID := terraform.Output(t, opts, "s3_endpoint_id")
	stsEndpointID := terraform.Output(t, opts, "sts_endpoint_id")
	kinesisEndpointID := terraform.Output(t, opts, "kinesis_endpoint_id")

	require.NotEmpty(t, s3EndpointID)
	require.NotEmpty(t, stsEndpointID)
	require.NotEmpty(t, kinesisEndpointID)
}

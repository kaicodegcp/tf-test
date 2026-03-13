package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsRouteTable_SE_UsEast1(t *testing.T) {
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

	rtID := terraform.Output(t, opts, "route_table_id")
	rtArn := terraform.Output(t, opts, "route_table_arn")
	vpcID := terraform.Output(t, opts, "vpc_id")

	require.NotEmpty(t, rtID)
	require.NotEmpty(t, rtArn)
	require.NotEmpty(t, vpcID)
}

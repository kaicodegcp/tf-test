package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestAwsSecurityGroup_SE_UsEast1(t *testing.T) {
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

	sgID := terraform.Output(t, opts, "security_group_id")
	sgArn := terraform.Output(t, opts, "security_group_arn")
	sgName := terraform.Output(t, opts, "security_group_name")

	require.NotEmpty(t, sgID)
	require.NotEmpty(t, sgArn)
	require.NotEmpty(t, sgName)
}

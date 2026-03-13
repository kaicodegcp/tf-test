package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestUser_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/user
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-user.auto.tfvars")

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
	userName := terraform.Output(t, opts, "user_name")
	aclPrincipalId := terraform.Output(t, opts, "acl_principal_id")
	home := terraform.Output(t, opts, "home")

	require.NotEmpty(t, id)
	require.NotEmpty(t, userName)
	require.NotEmpty(t, aclPrincipalId)
	require.NotEmpty(t, home)
}

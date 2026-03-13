package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestSqlWarehouse_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/sql_warehouse
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-sql-warehouse.auto.tfvars")

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
	name := terraform.Output(t, opts, "name")
	jdbcUrl := terraform.Output(t, opts, "jdbc_url")
	dataSourceId := terraform.Output(t, opts, "data_source_id")
	state := terraform.Output(t, opts, "state")

	require.NotEmpty(t, id)
	require.NotEmpty(t, name)
	require.NotEmpty(t, jdbcUrl)
	require.NotEmpty(t, dataSourceId)
	require.NotEmpty(t, state)
}

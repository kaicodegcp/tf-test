package test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

func TestCluster_SE_UsEast1(t *testing.T) {
	// Run from this folder: test/terratest/cluster
	cwd, err := os.Getwd()
	require.NoError(t, err)

	terraformDir := filepath.Clean(filepath.Join(cwd, "..", "..", "..", "infra", "terraform", "main"))

	varFile := filepath.Join(terraformDir, "aws-SE-99d097-databricks", "us-east-1", "terraform-cluster.auto.tfvars")

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
	clusterId := terraform.Output(t, opts, "cluster_id")
	clusterName := terraform.Output(t, opts, "cluster_name")
	state := terraform.Output(t, opts, "state")
	defaultTags := terraform.Output(t, opts, "default_tags")
	url := terraform.Output(t, opts, "url")

	require.NotEmpty(t, id)
	require.NotEmpty(t, clusterId)
	require.NotEmpty(t, clusterName)
	require.NotEmpty(t, state)
	require.NotEmpty(t, defaultTags)
	require.NotEmpty(t, url)
}

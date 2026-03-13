# Root module: Databricks Repo (Workspace level)
#
# Adapted from the repo module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/repo

resource "databricks_repo" "this" {
  url          = var.url
  path         = var.path
  git_provider = var.git_provider
  branch       = var.branch
  tag          = var.tag
  commit_hash  = var.commit_hash
}

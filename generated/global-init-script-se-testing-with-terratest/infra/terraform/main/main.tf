# Root module: Databricks Global Init Script (Workspace level)
#
# Adapted from the global-init-script module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/global-init-script

resource "databricks_global_init_script" "this" {
  name    = var.name
  enabled = var.enabled

  source         = var.script_source
  content_base64 = var.content_base64

  position = var.position
}

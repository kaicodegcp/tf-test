# Root module: Databricks Ip Access List (Workspace level)
#
# Adapted from the ip-access-list module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/ip-access-list

resource "databricks_ip_access_list" "this" {
  list_type    = var.list_type
  label        = var.label
  ip_addresses = var.ip_addresses
  enabled      = var.enabled
}

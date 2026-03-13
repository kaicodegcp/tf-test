# Root module: Databricks Group Member (Workspace level)
#
# Adapted from the group-member module at:
#   databricks-all-modules-feature-newtestsandmodules/modules/group-member

resource "databricks_group_member" "this" {
  group_id  = var.group_id
  member_id = var.member_id
}

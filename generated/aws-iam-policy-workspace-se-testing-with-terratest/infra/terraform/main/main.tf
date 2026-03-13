# Root module: AWS IAM Policy for Databricks Workspace
# Reference: databricks/terraform-databricks-sra

resource "aws_iam_policy" "this" {
  name        = "${var.resource_prefix}-${var.environment}-workspace-policy"
  description = "IAM policy for Databricks workspace operations"
  policy      = var.policy_document
}

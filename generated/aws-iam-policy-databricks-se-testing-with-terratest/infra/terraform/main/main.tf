# Root module: AWS IAM Policy for Databricks
# Reference: databricks/terraform-databricks-sra - credential.tf

resource "aws_iam_policy" "this" {
  name        = "${var.resource_prefix}-${var.environment}-databricks-policy"
  description = "IAM policy for Databricks cross-account access"
  policy      = var.policy_document
}

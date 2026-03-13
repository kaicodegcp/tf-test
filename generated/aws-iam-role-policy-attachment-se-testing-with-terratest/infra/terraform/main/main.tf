# Root module: AWS IAM Role Policy Attachment
# Reference: databricks/terraform-databricks-sra - credential.tf

resource "aws_iam_role_policy_attachment" "this" {
  role       = var.role_name
  policy_arn = var.policy_arn
}

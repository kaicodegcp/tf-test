# Root module: AWS IAM Role for Databricks Cross-Account Access
# Reference: databricks/terraform-databricks-sra - credential.tf

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "this" {
  name               = "${var.resource_prefix}-${var.environment}-cross-account-role"
  assume_role_policy = var.assume_role_policy
  description        = var.description

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-cross-account-role"
    Environment = var.environment
  }
}

resource "aws_iam_role_policy" "inline" {
  count = var.inline_policy != null ? 1 : 0

  name   = "${var.resource_prefix}-${var.environment}-inline-policy"
  role   = aws_iam_role.this.id
  policy = var.inline_policy
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

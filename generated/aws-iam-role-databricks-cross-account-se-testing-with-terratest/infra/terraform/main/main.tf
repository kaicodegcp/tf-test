# Root module: AWS IAM Cross-Account Role for Databricks
# Reference: databricks/terraform-databricks-sra - credential.tf

resource "aws_iam_role" "this" {
  name               = "${var.resource_prefix}-${var.environment}-cross-account-role"
  assume_role_policy = var.assume_role_policy
  description        = "Databricks cross-account IAM role"

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-cross-account-role"
    Environment = var.environment
  }
}

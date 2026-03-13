# Root module: AWS IAM Instance Profile
# Reference: databricks/terraform-databricks-sra

resource "aws_iam_instance_profile" "this" {
  name = "${var.resource_prefix}-${var.environment}-instance-profile"
  role = var.role_name

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-instance-profile"
    Environment = var.environment
  }
}

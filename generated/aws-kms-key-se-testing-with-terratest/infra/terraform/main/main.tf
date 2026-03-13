# Root module: AWS KMS Key for Databricks

resource "aws_kms_key" "this" {
  description             = "${var.resource_prefix}-${var.environment}-databricks-key"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = true

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-databricks-key"
    Environment = var.environment
  }
}

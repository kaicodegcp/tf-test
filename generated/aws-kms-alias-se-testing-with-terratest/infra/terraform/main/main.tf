# Root module: AWS KMS Alias

resource "aws_kms_alias" "this" {
  name          = "alias/${var.resource_prefix}-${var.environment}-databricks"
  target_key_id = var.target_key_id
}

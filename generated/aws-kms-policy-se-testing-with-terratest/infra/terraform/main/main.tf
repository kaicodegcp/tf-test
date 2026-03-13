# Root module: AWS KMS Key Policy for Databricks

data "aws_caller_identity" "current" {}

resource "aws_kms_key_policy" "this" {
  key_id = var.key_id
  policy = var.policy_document
}

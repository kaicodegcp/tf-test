# Root module: AWS S3 Bucket Policy for Databricks

resource "aws_s3_bucket_policy" "this" {
  bucket = var.bucket_id
  policy = var.policy_document
}

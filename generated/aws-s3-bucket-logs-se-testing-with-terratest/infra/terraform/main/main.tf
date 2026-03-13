# Root module: AWS S3 Bucket for Databricks Logs

resource "aws_s3_bucket" "this" {
  bucket        = "${var.resource_prefix}-${var.environment}-log-delivery"
  force_destroy = true

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-log-delivery"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

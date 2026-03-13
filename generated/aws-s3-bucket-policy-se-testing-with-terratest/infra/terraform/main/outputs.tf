output "bucket_id" {
  description = "The S3 bucket ID the policy is attached to."
  value       = aws_s3_bucket_policy.this.bucket
}

output "vpc_id" {
  description = "The VPC ID."
  value       = aws_vpc.this.id
}

output "private_subnet_ids" {
  description = "The private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "security_group_id" {
  description = "The security group ID."
  value       = aws_security_group.this.id
}

output "s3_bucket_name" {
  description = "The S3 root storage bucket name."
  value       = aws_s3_bucket.root_storage.bucket
}

output "iam_role_arn" {
  description = "The cross-account IAM role ARN."
  value       = aws_iam_role.cross_account.arn
}

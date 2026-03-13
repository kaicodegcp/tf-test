output "role_arn" {
  description = "The ARN of the IAM role."
  value       = aws_iam_role.this.arn
}

output "role_name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.this.name
}

output "role_id" {
  description = "The ID of the IAM role."
  value       = aws_iam_role.this.id
}

output "account_id" {
  description = "The AWS account ID."
  value       = data.aws_caller_identity.current.account_id
}

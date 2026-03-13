output "policy_arn" {
  description = "The ARN of the workspace IAM policy."
  value       = aws_iam_policy.this.arn
}

output "policy_name" {
  description = "The name of the workspace IAM policy."
  value       = aws_iam_policy.this.name
}

output "policy_id" {
  description = "The ID of the workspace IAM policy."
  value       = aws_iam_policy.this.id
}

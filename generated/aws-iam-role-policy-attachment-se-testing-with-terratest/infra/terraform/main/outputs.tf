output "role_name" {
  description = "The role name."
  value       = aws_iam_role_policy_attachment.this.role
}

output "policy_arn" {
  description = "The policy ARN."
  value       = aws_iam_role_policy_attachment.this.policy_arn
}

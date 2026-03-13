output "key_id" {
  description = "The KMS key ID the policy is attached to."
  value       = aws_kms_key_policy.this.key_id
}

output "account_id" {
  description = "The AWS account ID."
  value       = data.aws_caller_identity.current.account_id
}

output "alias_arn" {
  description = "The ARN of the KMS alias."
  value       = aws_kms_alias.this.arn
}

output "alias_name" {
  description = "The name of the KMS alias."
  value       = aws_kms_alias.this.name
}

output "target_key_arn" {
  description = "The ARN of the target KMS key."
  value       = aws_kms_alias.this.target_key_arn
}

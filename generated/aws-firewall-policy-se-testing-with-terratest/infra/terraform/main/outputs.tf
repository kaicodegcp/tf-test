output "policy_arn" {
  description = "The ARN of the firewall policy."
  value       = aws_networkfirewall_firewall_policy.this.arn
}

output "policy_name" {
  description = "The name of the firewall policy."
  value       = aws_networkfirewall_firewall_policy.this.name
}

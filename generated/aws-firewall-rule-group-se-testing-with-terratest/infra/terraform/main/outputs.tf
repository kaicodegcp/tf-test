output "rule_group_arn" {
  description = "The ARN of the firewall rule group."
  value       = aws_networkfirewall_rule_group.this.arn
}

output "rule_group_name" {
  description = "The name of the firewall rule group."
  value       = aws_networkfirewall_rule_group.this.name
}

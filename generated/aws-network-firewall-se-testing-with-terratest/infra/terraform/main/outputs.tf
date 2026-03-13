output "firewall_id" {
  description = "The ID of the network firewall."
  value       = aws_networkfirewall_firewall.this.id
}

output "firewall_arn" {
  description = "The ARN of the network firewall."
  value       = aws_networkfirewall_firewall.this.arn
}

output "firewall_status" {
  description = "The status of the network firewall."
  value       = aws_networkfirewall_firewall.this.firewall_status
}

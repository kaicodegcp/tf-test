output "privatelink_sg_id" {
  description = "The ID of the PrivateLink security group."
  value       = aws_security_group.privatelink.id
}

output "workspace_endpoint_id" {
  description = "The ID of the Databricks workspace VPC endpoint."
  value       = aws_vpc_endpoint.workspace.id
}

output "relay_endpoint_id" {
  description = "The ID of the Databricks SCC relay VPC endpoint."
  value       = aws_vpc_endpoint.relay.id
}

output "workspace_endpoint_dns" {
  description = "DNS entries of the workspace VPC endpoint."
  value       = aws_vpc_endpoint.workspace.dns_entry
}

output "relay_endpoint_dns" {
  description = "DNS entries of the relay VPC endpoint."
  value       = aws_vpc_endpoint.relay.dns_entry
}

output "endpoint_id" {
  description = "The ID of the Databricks workspace VPC endpoint."
  value       = aws_vpc_endpoint.workspace.id
}

output "dns_entry" {
  description = "DNS entries of the workspace endpoint."
  value       = aws_vpc_endpoint.workspace.dns_entry
}

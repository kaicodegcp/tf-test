output "endpoint_id" {
  description = "The ID of the Databricks relay VPC endpoint."
  value       = aws_vpc_endpoint.relay.id
}

output "dns_entry" {
  description = "DNS entries of the relay endpoint."
  value       = aws_vpc_endpoint.relay.dns_entry
}

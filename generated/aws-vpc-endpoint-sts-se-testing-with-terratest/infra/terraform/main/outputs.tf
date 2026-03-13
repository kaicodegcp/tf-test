output "endpoint_id" {
  description = "The ID of the STS VPC endpoint."
  value       = aws_vpc_endpoint.sts.id
}

output "dns_entry" {
  description = "DNS entries of the STS endpoint."
  value       = aws_vpc_endpoint.sts.dns_entry
}

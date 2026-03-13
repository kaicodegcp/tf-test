output "endpoint_id" {
  description = "The ID of the Kinesis VPC endpoint."
  value       = aws_vpc_endpoint.kinesis.id
}

output "dns_entry" {
  description = "DNS entries of the Kinesis endpoint."
  value       = aws_vpc_endpoint.kinesis.dns_entry
}

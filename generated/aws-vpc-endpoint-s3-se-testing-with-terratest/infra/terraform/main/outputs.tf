output "endpoint_id" {
  description = "The ID of the S3 VPC endpoint."
  value       = aws_vpc_endpoint.s3.id
}

output "prefix_list_id" {
  description = "The prefix list ID of the S3 endpoint."
  value       = aws_vpc_endpoint.s3.prefix_list_id
}

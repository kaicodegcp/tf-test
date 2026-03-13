output "s3_endpoint_id" {
  description = "The ID of the S3 VPC Gateway endpoint."
  value       = aws_vpc_endpoint.s3.id
}

output "sts_endpoint_id" {
  description = "The ID of the STS VPC Interface endpoint."
  value       = aws_vpc_endpoint.sts.id
}

output "kinesis_endpoint_id" {
  description = "The ID of the Kinesis VPC Interface endpoint."
  value       = aws_vpc_endpoint.kinesis_streams.id
}

output "s3_endpoint_prefix_list_id" {
  description = "The prefix list ID of the S3 endpoint."
  value       = aws_vpc_endpoint.s3.prefix_list_id
}

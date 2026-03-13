output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = aws_subnet.private[*].id
}

output "private_subnet_arns" {
  description = "ARNs of the private subnets."
  value       = aws_subnet.private[*].arn
}

output "private_subnet_cidr_blocks" {
  description = "CIDR blocks of the private subnets."
  value       = aws_subnet.private[*].cidr_block
}

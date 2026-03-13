output "subnet_id" {
  description = "The ID of the private subnet."
  value       = aws_subnet.private.id
}

output "subnet_arn" {
  description = "The ARN of the private subnet."
  value       = aws_subnet.private.arn
}

output "subnet_cidr_block" {
  description = "The CIDR block of the private subnet."
  value       = aws_subnet.private.cidr_block
}

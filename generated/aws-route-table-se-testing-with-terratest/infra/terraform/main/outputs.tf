output "route_table_id" {
  description = "The ID of the route table."
  value       = aws_route_table.this.id
}

output "route_table_arn" {
  description = "The ARN of the route table."
  value       = aws_route_table.this.arn
}

output "vpc_id" {
  description = "The VPC ID of the route table."
  value       = aws_route_table.this.vpc_id
}

output "route_table_association_ids" {
  description = "IDs of the route table associations."
  value       = aws_route_table_association.this[*].id
}

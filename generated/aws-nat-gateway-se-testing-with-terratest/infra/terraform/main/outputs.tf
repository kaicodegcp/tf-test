output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_public_ip" {
  description = "The public IP of the NAT Gateway."
  value       = aws_nat_gateway.this.public_ip
}

output "eip_id" {
  description = "The Elastic IP allocation ID."
  value       = aws_eip.this.id
}

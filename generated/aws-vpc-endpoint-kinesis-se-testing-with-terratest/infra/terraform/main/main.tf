# Root module: AWS VPC Endpoint for Kinesis (Interface)
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_vpc_endpoint" "kinesis" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.kinesis-streams"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = var.security_group_ids
  subnet_ids          = var.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-kinesis-vpc-endpoint"
    Environment = var.environment
  }
}

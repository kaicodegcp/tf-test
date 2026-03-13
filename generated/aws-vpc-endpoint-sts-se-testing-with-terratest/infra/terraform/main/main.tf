# Root module: AWS VPC Endpoint for STS (Interface)
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_vpc_endpoint" "sts" {
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.sts"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = var.security_group_ids
  subnet_ids          = var.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-sts-vpc-endpoint"
    Environment = var.environment
  }
}

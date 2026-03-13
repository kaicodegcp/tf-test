# Root module: AWS VPC Endpoints for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids

  tags = {
    Name        = "${var.resource_prefix}-s3-vpc-endpoint"
    Environment = var.environment
  }
}

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

resource "aws_vpc_endpoint" "kinesis_streams" {
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

# Root module: AWS VPC Endpoint for S3 (Gateway)
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

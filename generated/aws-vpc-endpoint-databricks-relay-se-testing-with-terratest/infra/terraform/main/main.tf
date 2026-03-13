# Root module: AWS VPC Endpoint for Databricks SCC Relay
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_vpc_endpoint" "relay" {
  vpc_id              = var.vpc_id
  service_name        = var.relay_vpce_service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = var.security_group_ids
  subnet_ids          = var.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-databricks-relay"
    Environment = var.environment
  }
}

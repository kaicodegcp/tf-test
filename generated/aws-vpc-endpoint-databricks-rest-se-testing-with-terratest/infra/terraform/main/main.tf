# Root module: AWS VPC Endpoint for Databricks Workspace REST API
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_vpc_endpoint" "workspace" {
  vpc_id              = var.vpc_id
  service_name        = var.workspace_vpce_service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = var.security_group_ids
  subnet_ids          = var.subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-databricks-workspace"
    Environment = var.environment
  }
}

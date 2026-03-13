# Root module: AWS VPC for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.resource_prefix}-vpc"
    Environment = var.environment
  }
}

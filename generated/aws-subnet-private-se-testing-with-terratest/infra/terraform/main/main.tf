# Root module: AWS Private Subnet for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_subnet" "private" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.resource_prefix}-private-${var.availability_zone}"
    Environment = var.environment
  }
}

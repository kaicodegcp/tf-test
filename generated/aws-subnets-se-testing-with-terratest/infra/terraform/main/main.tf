# Root module: AWS Subnets for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf (subnets)

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.resource_prefix}-private-${var.availability_zones[count.index]}"
    Environment = var.environment
  }
}

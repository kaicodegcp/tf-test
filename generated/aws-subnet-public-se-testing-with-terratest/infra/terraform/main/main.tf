# Root module: AWS Public Subnet
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.resource_prefix}-public-${var.availability_zone}"
    Environment = var.environment
  }
}

# Root module: AWS NAT Gateway
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name        = "${var.resource_prefix}-nat-eip"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.subnet_id

  tags = {
    Name        = "${var.resource_prefix}-nat-gw"
    Environment = var.environment
  }

  depends_on = [aws_eip.this]
}

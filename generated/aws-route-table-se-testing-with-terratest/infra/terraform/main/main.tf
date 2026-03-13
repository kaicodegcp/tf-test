# Root module: AWS Route Table

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.resource_prefix}-private-rt"
    Environment = var.environment
  }
}

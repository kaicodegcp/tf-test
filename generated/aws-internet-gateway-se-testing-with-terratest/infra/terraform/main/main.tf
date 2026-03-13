# Root module: AWS Internet Gateway

resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.resource_prefix}-igw"
    Environment = var.environment
  }
}

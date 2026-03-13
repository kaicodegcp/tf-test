# Root module: AWS Internet Gateway
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.resource_prefix}-igw"
    Environment = var.environment
  }
}

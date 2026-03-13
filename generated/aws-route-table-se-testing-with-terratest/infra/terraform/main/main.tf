# Root module: AWS Route Table for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.resource_prefix}-private-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "this" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.this.id
}

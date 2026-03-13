# Root module: AWS Route Table Association
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_route_table_association" "this" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}

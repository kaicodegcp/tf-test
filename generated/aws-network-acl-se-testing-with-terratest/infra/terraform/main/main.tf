# Root module: AWS Network ACL
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name        = "${var.resource_prefix}-nacl"
    Environment = var.environment
  }
}

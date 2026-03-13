# Root module: AWS Security Group for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_security_group" "this" {
  name        = "${var.resource_prefix}-workspace-sg"
  description = "Databricks workspace security group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["tcp", "udp"]
    content {
      description = "Databricks - Internode Communication"
      from_port   = 0
      to_port     = 65535
      protocol    = ingress.value
      self        = true
    }
  }

  dynamic "egress" {
    for_each = ["tcp", "udp"]
    content {
      description = "Databricks - Internode Communication"
      from_port   = 0
      to_port     = 65535
      protocol    = egress.value
      self        = true
    }
  }

  egress {
    description = "Databricks - HTTPS to Control Plane"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.resource_prefix}-workspace-sg"
    Environment = var.environment
  }
}

# Root module: AWS Security Group for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - network.tf

resource "aws_security_group" "this" {
  name        = "${var.resource_prefix}-workspace-sg"
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["tcp", "udp"]
    content {
      description = "Databricks - Workspace SG - Internode Communication"
      from_port   = 0
      to_port     = 65535
      protocol    = ingress.value
      self        = true
    }
  }

  dynamic "egress" {
    for_each = ["tcp", "udp"]
    content {
      description = "Databricks - Workspace SG - Internode Communication"
      from_port   = 0
      to_port     = 65535
      protocol    = egress.value
      self        = true
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      description = "Databricks - Control Plane Communication"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = var.egress_cidr_blocks
    }
  }

  tags = {
    Name        = "${var.resource_prefix}-workspace-sg"
    Environment = var.environment
  }
}

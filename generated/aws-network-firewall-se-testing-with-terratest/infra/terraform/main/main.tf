# Root module: AWS Network Firewall

resource "aws_networkfirewall_firewall" "this" {
  name                = "${var.resource_prefix}-${var.environment}-firewall"
  firewall_policy_arn = var.firewall_policy_arn
  vpc_id              = var.vpc_id

  dynamic "subnet_mapping" {
    for_each = var.subnet_ids
    content {
      subnet_id = subnet_mapping.value
    }
  }

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-firewall"
    Environment = var.environment
  }
}

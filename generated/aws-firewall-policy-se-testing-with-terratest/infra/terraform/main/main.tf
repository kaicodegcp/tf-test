# Root module: AWS Network Firewall Policy

resource "aws_networkfirewall_firewall_policy" "this" {
  name = "${var.resource_prefix}-${var.environment}-fw-policy"

  firewall_policy {
    stateless_default_actions          = ["aws:forward_to_sfe"]
    stateless_fragment_default_actions = ["aws:forward_to_sfe"]
  }

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-fw-policy"
    Environment = var.environment
  }
}

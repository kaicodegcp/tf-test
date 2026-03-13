# Root module: AWS Network Firewall Rule Group

resource "aws_networkfirewall_rule_group" "this" {
  capacity = var.capacity
  name     = "${var.resource_prefix}-${var.environment}-fw-rule-group"
  type     = "STATEFUL"

  rule_group {
    rules_source {
      rules_source_list {
        generated_rules_type = "ALLOWLIST"
        target_types         = ["HTTP_HOST", "TLS_SNI"]
        targets              = var.allowed_domains
      }
    }
  }

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-fw-rule-group"
    Environment = var.environment
  }
}

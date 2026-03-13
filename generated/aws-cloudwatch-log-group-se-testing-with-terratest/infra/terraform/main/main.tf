# Root module: AWS CloudWatch Log Group

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/databricks/${var.resource_prefix}-${var.environment}"
  retention_in_days = var.retention_in_days

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-log-group"
    Environment = var.environment
  }
}

# Root module: AWS CloudTrail

resource "aws_cloudtrail" "this" {
  name                          = "${var.resource_prefix}-${var.environment}-trail"
  s3_bucket_name                = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = false
  enable_logging                = true

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-trail"
    Environment = var.environment
  }
}

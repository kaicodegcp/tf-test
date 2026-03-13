# Mandatory
aws_region             = "us-east-1"
environment            = "se"
resource_prefix        = "tf-test"
vpc_id                 = "vpc-PLACEHOLDER"
workspace_vpce_service = "com.amazonaws.vpce.us-east-1.vpce-svc-09143d1e626de2f04"
security_group_ids     = ["sg-PLACEHOLDER"]
subnet_ids             = ["subnet-PLACEHOLDER"]

# Notes:
# - AWS credentials must be provided via env vars (see repo README).

# Mandatory
aws_region      = "us-east-1"
environment     = "se"
resource_prefix = "tf-test"
key_id          = "PLACEHOLDER_KEY_ID"
policy_document = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM policies",
      "Effect": "Allow",
      "Principal": {"AWS": "arn:aws:iam::PLACEHOLDER:root"},
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF

# Notes:
# - AWS credentials must be provided via env vars (see repo README).

# Mandatory
aws_region      = "us-east-1"
environment     = "se"
resource_prefix = "tf-test"
bucket_id       = "PLACEHOLDER-BUCKET"
policy_document = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Grant Databricks Access",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::414351767826:root"
      },
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::PLACEHOLDER-BUCKET/*",
        "arn:aws:s3:::PLACEHOLDER-BUCKET"
      ]
    }
  ]
}
EOF

# Notes:
# - AWS credentials must be provided via env vars (see repo README).

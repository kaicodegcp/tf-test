aws_region      = "us-east-1"
environment     = "se"
resource_prefix = "tf-test"
policy_document = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::tf-test-se-*",
        "arn:aws:s3:::tf-test-se-*/*"
      ]
    }
  ]
}
EOF

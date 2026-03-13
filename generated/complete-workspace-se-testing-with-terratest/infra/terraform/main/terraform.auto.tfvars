aws_region         = "us-east-1"
environment        = "se"
resource_prefix    = "tf-test"
assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::414351767826:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "PLACEHOLDER_EXTERNAL_ID"
        }
      }
    }
  ]
}
EOF

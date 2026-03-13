# Provider config relies on environment variables:
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   AWS_DEFAULT_REGION
#
# This keeps secrets out of tfvars and repo history.
provider "aws" {
  region = var.aws_region
}

# Root module: Complete Workspace Orchestration
# This module orchestrates the full end-to-end Databricks workspace creation.
# It references outputs from individual AWS and Databricks modules.

# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.resource_prefix}-vpc"
    Environment = var.environment
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + 1)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.resource_prefix}-private-${count.index}"
    Environment = var.environment
  }
}

# Security Group
resource "aws_security_group" "this" {
  name        = "${var.resource_prefix}-workspace-sg"
  description = "Databricks workspace security group"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.resource_prefix}-workspace-sg"
    Environment = var.environment
  }
}

# S3 Root Storage Bucket
resource "aws_s3_bucket" "root_storage" {
  bucket        = "${var.resource_prefix}-${var.environment}-root-storage"
  force_destroy = true

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-root-storage"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "root_storage" {
  bucket                  = aws_s3_bucket.root_storage.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# IAM Cross-Account Role
resource "aws_iam_role" "cross_account" {
  name               = "${var.resource_prefix}-${var.environment}-cross-account-role"
  assume_role_policy = var.assume_role_policy

  tags = {
    Name        = "${var.resource_prefix}-${var.environment}-cross-account-role"
    Environment = var.environment
  }
}

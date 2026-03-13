# Root module: AWS PrivateLink for Databricks Workspace
# Reference: databricks/terraform-databricks-sra - privatelink.tf

resource "aws_security_group" "privatelink" {
  name        = "${var.resource_prefix}-privatelink-sg"
  description = "Security group for Databricks PrivateLink endpoints"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - REST API"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - Secure Cluster Connectivity"
    from_port       = 6666
    to_port         = 6666
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - Secure Cluster Connectivity - Compliance"
    from_port       = 2443
    to_port         = 2443
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - PostgreSQL - Lakebase"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - Control Plane Internal Calls"
    from_port       = 8443
    to_port         = 8443
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - Unity Catalog Logging and Lineage"
    from_port       = 8444
    to_port         = 8444
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  ingress {
    description     = "Databricks - PrivateLink Endpoint SG - Future Extendability"
    from_port       = 8445
    to_port         = 8451
    protocol        = "tcp"
    security_groups = var.workspace_security_group_ids
  }

  tags = {
    Name        = "${var.resource_prefix}-privatelink-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "workspace" {
  vpc_id              = var.vpc_id
  service_name        = var.workspace_vpce_service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.privatelink.id]
  subnet_ids          = var.privatelink_subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-databricks-workspace"
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "relay" {
  vpc_id              = var.vpc_id
  service_name        = var.relay_vpce_service
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.privatelink.id]
  subnet_ids          = var.privatelink_subnet_ids
  private_dns_enabled = true

  tags = {
    Name        = "${var.resource_prefix}-databricks-relay"
    Environment = var.environment
  }
}

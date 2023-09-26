resource "aws_security_group_rule" "app-to-datastore" {
  security_group_id        = var.app_metadata["security_group_id"]
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = local.db_security_group_id
}

resource "aws_security_group_rule" "datastore-from-app" {
  security_group_id        = local.db_security_group_id
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = var.app_metadata["security_group_id"]
}
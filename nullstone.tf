terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

data "ns_connection" "mongo" {
  name = "mongo"
  type = "mongo/aws"
  contract = "datastore/aws/mongo:*"
}

locals {
  db_endpoint          = data.ns_connection.mongo.outputs.db_endpoint
  db_port              = split(":", local.db_endpoint)[1]
  db_security_group_id = data.ns_connection.mongo.outputs.db_security_group_id
  db_admin_secret_id   = data.ns_connection.mongo.outputs.db_admin_secret_id
}

data "aws_secretsmanager_secret_version" "admin" {
  secret_id = local.db_admin_secret_id
}

locals {
  admin          = jsondecode(data.aws_secretsmanager_secret_version.admin.secret_string)
  admin_username = local.admin["username"]
  admin_password = local.admin["password"]
}

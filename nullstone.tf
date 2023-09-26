terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.11.1"
    }
  }
}

data "ns_workspace" "this" {}

data "ns_connection" "mongo" {
  name = "mongo"
  type = "mongo/aws"
  contract = "datastore/aws/mongo:atlas"
}

locals {
  // TODO: make the atlas variables secrets and share the secret id
  atlas_project_id     = data.ns_connection.mongo.outputs.atlas_project_id
  atlas_public_key     = data.ns_connection.mongo.outputs.atlas_public_key
  atlas_private_key    = data.ns_connection.mongo.outputs.atlas_private_key
  db_endpoint          = data.ns_connection.mongo.outputs.db_endpoint
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

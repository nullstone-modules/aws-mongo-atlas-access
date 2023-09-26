resource "mongodbatlas_database_user" "test" {
  username           = local.username
  password           = random_password.this.result
  project_id         = local.atlas_project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.database_name
  }

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }
}

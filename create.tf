resource "mongodbatlas_database_user" "this" {
  project_id         = local.atlas_project_id
  username           = local.username
  password           = random_password.this.result
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = local.database_name
  }

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }
}

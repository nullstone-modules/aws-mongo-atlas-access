output "env" {
  value = [
    {
      name  = "MONGO_USER"
      value = local.username
    },
    {
      name  = "MONGO_DB"
      value = local.database_name
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "MONGO_PASSWORD"
      value = random_password.this.result
    },
    {
      name  = "MONGO_URL"
      value = "mongodb://${urlencode(local.username)}:${urlencode(random_password.this.result)}@${local.db_endpoint}/${urlencode(local.database_name)}"
    }
  ]
}

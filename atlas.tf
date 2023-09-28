provider "mongodbatlas" {
  public_key  = data.aws_secretsmanager_secret_version.atlas_public_key.secret_string
  private_key = data.aws_secretsmanager_secret_version.atlas_private_key.secret_string
}

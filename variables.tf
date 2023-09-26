variable "app_metadata" {
  description = <<EOF
App Metadata is injected from the app on-the-fly.
This contains information about resources created in the app module that are needed by the capability.
EOF

  type    = map(string)
  default = {}
}

variable "database_name" {
  type        = string
  description = "Name of database to access in mongo cluster. If left empty, uses app name."
  default     = ""
}

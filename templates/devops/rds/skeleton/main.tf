
resource "vault_mount" "kvv2" {
  path        = "root_db"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "kvv2" {
  mount                      = vault_mount.kvv2.path
  name                       = "secret"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    master       = "${local.config.password}"
  }
  )

}

resource "vault_mount" "db" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secrets_mount" "db" {
  path = "datasources"

  postgresql {
    name              = "postgres"
    username          = aws_db_instance.RDS_VKPR.username
    password          = local.config.password
    connection_url    = "postgresql://{{username}}:{{password}}@${aws_db_instance.RDS_VKPR.address}:${aws_db_instance.RDS_VKPR.port}/postgres"
    verify_connection = true
    allowed_roles = [
      "dev2","readWrite","readOnly"
    ]
  }
  depends_on = [ aws_db_instance.RDS_VKPR ]
}

resource "vault_database_secret_backend_role" "readOnly" {
  name    = "readOnly"
  backend = vault_database_secrets_mount.db.path
  db_name = vault_database_secrets_mount.db.postgresql[0].name
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]
}

resource "vault_database_secret_backend_role" "readWrite" {
  name    = "readWrite"
  backend = vault_database_secrets_mount.db.path
  db_name = vault_database_secrets_mount.db.postgresql[0].name
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT ALL ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]
}

resource "aws_db_instance" "RDS_VKPR" {
    identifier             = local.config.identifier
    instance_class         = local.config.instance_class
    allocated_storage      = local.config.allocated_storage
    engine                 = local.config.engine
    engine_version         = local.config.engine_version
    db_name  = local.config.instance_name
    username = local.config.username
    password = local.config.password
    skip_final_snapshot = true
    publicly_accessible = true
    tags = {
    name = "VKPR-RDS"
  }
}

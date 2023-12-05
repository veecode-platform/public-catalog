##### AWS_DB_SUBNET_GROUP ######
variable "name_db_subnet_group"{}
variable "description_db_subnet_group"{}

##### AWS_DB_PARAMETER_GROUP #####
variable "name_db_parameter_group" {}
variable "family_db_parameter_group"{}
variable "description_db_parameter_group"{}

##### AWS_DB_INSTANCE #####
variable "allocated_storage" {}
variable "var.max_allocated_storage" {}
variable "var.engine"{}
variable "var.engine_version"{}
variable "var.instane_class" {}
variable "var.indentifier"{}
variable "var.username" {}
variable "var.password" {}
variable "username" {}
variable "password" {}
variable "var.multi_az" {}
variable "var.storage_type"{}
variable "var.backup_retention_period"{}
variable "var.backup_window"{}
variable "var.maintenance_window"{}
variable "publicly_accessible" {}
variable "skip_final_snapshot"{}
variable "iam_database_authentication_enabled"{}
variable "performance_insights_retention_period" {}
variable "deletion_protection"{}
variable "storage_encrypted"{}
variable "resource_tags"{}
variable "name_suffix"{}

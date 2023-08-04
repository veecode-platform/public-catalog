##### AWS_DB_SUBNET_GROUP ######
variable "name_db_subnet_group"{}
variable "description_db_subnet_group"{}
variable "subnet_ids"{}

##### AWS_DB_PARAMETER_GROUP #####
variable "name_db_parameter_group" {}
variable "family_db_parameter_group"{}
variable "description_db_parameter_group"{}

##### AWS_DB_INSTANCE #####
variable "allocated_storage" {}
variable "max_allocated_storage" {}
variable "engine"{}
variable "engine_version"{}
variable "instance_class" {}
variable "identifier"{}
variable "db_name"{}
variable "username" {}
variable "password" {}
variable "multi_az" {}
variable "storage_type"{}
variable "backup_retention_period"{}
variable "backup_window"{}
variable "maintenance_window"{}
variable "publicly_accessible" {}
variable "skip_final_snapshot"{}
variable "iam_database_authentication_enabled"{}
variable "monitoring_interval"{}
variable "performance_insights_retention_period" {}
variable "deletion_protection"{}
variable "storage_encrypted"{}
variable "resource_tags"{}

### DATA

variable "name_suffix"{}



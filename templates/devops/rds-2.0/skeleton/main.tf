module "banco_rds" {
  source  = "./banco_rds"
#create aws db subnet group
  name_db_subnet_group        = local.name_db_subnet_group
  description_db_subnet_group = local.description_db_subnet_group
  subnet_ids = local.subnet_ids
  
#create aws db parameter group
  name_db_parameter_group        = local.name_db_parameter_group
  family_db_parameter_group      = local.family_db_parameter_group
  description_db_parameter_group = local.description_db_parameter_group
#create aws instance_RDS
  allocated_storage                     = local.allocated_storage                  
  max_allocated_storage                 = local.max_allocated_storage              
  engine                                = local.engine 
  engine_version                        = local.engine_version    
  instance_class                        = local.instance_class     
  identifier                            = local.identifier
  db_name                               = local.dbname
  username                              = local.username           
  password                              = local.password 
  multi_az                              = local.multi_az                                      
  storage_type                          = local.storage_type
  backup_retention_period               = local.backup_retention_period
  backup_window                         = local.backup_window
  maintenance_window                    = local.maintenance_window
  publicly_accessible                   = local.publicly_accessible
  skip_final_snapshot                   = local.skip_final_snapshot
  enabled_cloudwatch_logs_exports       = local.enabled_cloudwatch_logs_exports
  iam_database_authentication_enabled   = local.iam_database_authentication_enabled
  enabled_cloudwatch_logs_exports       = local.enabled_cloudwatch_logs_exports
  monitoring_interval                   = local.monitoring_interval
  performance_insights_retention_period = local.performance_insights_retention_period
  deletion_protection                   = local.deletion_protection 
  storage_encrypted                     = local.storage_encrypted
  tags                                  = local.resource_tags
  name_suffix                           = local.name_suffix
}
output "rds"{
  value=module.banco_rds.rds
 }

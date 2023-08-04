module "banco_rds" {
  source  = "./banco_rds"
#create aws db subnet group
  name_db_subnet_group        = local.config.name_db_subnet_group
  description_db_subnet_group = local.config.description_db_subnet_group
  subnet_ids                  = local.config.subnet_ids 
#create aws db parameter group
  name_db_parameter_group        = local.config.name_db_parameter_group
  family_db_parameter_group      = local.config.family_db_parameter_group
  description_db_parameter_group = local.config.description_db_parameter_group
#create aws instance_RDS 
  allocated_storage                     = local.config.allocated_storage                  
  max_allocated_storage                 = local.config.max_allocated_storage              
  engine                                = local.config.engine 
  engine_version                        = local.config.engine_version    
  instance_class                        = local.config.instance_class     
  identifier                            = local.config.identifier
  db_name                               = local.config.db_name
  username                              = local.config.username           
  password                              = local.config.password 
  multi_az                              = local.config.multi_az                                      
  storage_type                          = local.config.storage_type
  backup_retention_period               = local.config.backup_retention_period
  backup_window                         = local.config.backup_window
  maintenance_window                    = local.config.maintenance_window
  publicly_accessible                   = local.config.publicly_accessible
  skip_final_snapshot                   = local.config.skip_final_snapshot
  iam_database_authentication_enabled   = local.config.iam_database_authentication_enabled
  monitoring_interval                   = local.config.monitoring_interval
  performance_insights_retention_period = local.config.performance_insights_retention_period
  deletion_protection                   = local.config.deletion_protection 
  storage_encrypted                     = local.config.storage_encrypted
  resource_tags                         = local.config.tags
  name_suffix                           = local.config.name_suffix
  
}
output "rds"{
  value=module.banco_rds.rds
 }

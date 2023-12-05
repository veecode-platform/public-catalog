#create aws db subnet group
resource "aws_db_subnet_group" "${{ values.engine }}-subnet" {
  name        = var.name_db_subnet_group
  description = var.description_db_subnet_group
  # subnet_ids  = data.aws_subnets.subnet-private.ids
  subnet_ids = var.subnet_ids
}

#create aws db parameter group
resource "aws_db_parameter_group" "${{ values.engine }}-parameters" {
  name        = var.name_db_parameter_group
  family      = var.family_db_parameter_group
  description = var.description_db_parameter_group
  parameter {
    name  = "log_connections"
    value = "1"
  }

}

resource "aws_db_instance" "rds_instance" {
  allocated_storage                     = var.allocated_storage                  # 3 GB of storage, gives us more IOPS than a lower number
  max_allocated_storage                 = var.max_allocated_storage              # Maximun storage alocate
  engine                                = var.engine #Engine of RDS
  engine_version                        = var.engine_version     #Version 
  instance_class                        = var.instance_class      # use micro if you want to use the free tier
  identifier                            = var.identifier
  db_name                               = var.dbname
  username                              = var.username           # username
  password                              = var.password # password
  db_subnet_group_name                  = aws_db_subnet_group.${{ values.engine }}-subnet.name
  parameter_group_name                  = aws_db_parameter_group.${{ values.engine }}-parameters.name
  multi_az                              = var.multi_az                                       # set to true to have high availability: 2 instances synchronized with each other
  availability_zone                     = data.aws_availability_zones.available.names[0] # prefered AZ
  vpc_security_group_ids                = [aws_security_group.allow-${{ values.engine }}.id]
  storage_type                          = var.storage_type
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  maintenance_window                    = var.maintenance_window
  publicly_accessible                   = var.publicly_accessible
  skip_final_snapshot                   = var.skip_final_snapshot
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports #enble export logs to cloudwatch  
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = aws_iam_role.rds_enhanced_monitoring.arn
  performance_insights_enabled          = true
  performance_insights_retention_period = var.performance_insights_retention_period
  copy_tags_to_snapshot                 = true
  deletion_protection                   = var.deletion_protection #Prevent to eliminate unexpected RDS
  storage_encrypted                     = var.storage_encrypted
  tags                                  = var.resource_tags
}

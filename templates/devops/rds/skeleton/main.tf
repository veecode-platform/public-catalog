module "rds" {
  source  = "./rds"
  allocated_storage              = local.config.allocated_storage
  engine                         = local.config.engine
  engine_version                 = local.config.engine_version
  instance_class                 = local.config.instance_class
  dbname                           = local.config.name
  username                       = local.config.username
  password                       = local.config.password
  skip_final_snapshot            = local.config.skip_final_snapshot
}

resource "aws_db_instance" "RDS_VKPR" {
    allocated_storage = var.allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    db_name = var.dbname
    username = var.username
    password = var.password
    skip_final_snapshot = var.skip_final_snapshot
    final_snapshot_identifier = "${var.dbname}-snapshot"
    tags = {
    name = "VKPR-RDS"
  }
}
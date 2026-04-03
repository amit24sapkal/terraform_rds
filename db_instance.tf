resource "aws_db_instance" "db_instance" {

  identifier               = "tcw-rds-instance"
  engine                   = var.engine_name
  engine_version           = "8.0"
  instance_class           = var.instance_class
  allocated_storage        = 20
  storage_type             = "gp2"
  db_name                  = var.db_name
  username                 = var.user_name
  password                 = var.pass
  db_subnet_group_name     = aws_db_subnet_group.db_sub_group.name
  vpc_security_group_ids   = [aws_security_group.tcw_sg.id]
  multi_az                 = var.multi_az_deployment
  publicly_accessible      = var.public_access
  skip_final_snapshot      = var.skip_finalSnapshot
  delete_automated_backups = var.delete_automated_backup

  tags = {
    Name = "tcw_rds_instance"
  }
}

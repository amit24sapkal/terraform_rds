output "subnet_data" {
  value = [aws_subnet.tcw_database_1.id, aws_subnet.tcw_database_2.id]
}

output "rds_address" {
  value = aws_db_instance.db_instance.address
}

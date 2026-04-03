###############################################################
## DB Subnet Group creation
###############################################################

resource "aws_db_subnet_group" "db_sub_group" {

  name       = "tcw-db-subnet-group"
  subnet_ids = [aws_subnet.tcw_database_1.id, aws_subnet.tcw_database_2.id]

  tags = {
    Name = "tcw_db_subnet_group"
  }
}

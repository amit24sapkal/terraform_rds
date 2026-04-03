resource "aws_vpc" "tcw_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tcw_vpc"
  }
}

resource "aws_subnet" "tcw_database_1" {
  vpc_id            = aws_vpc.tcw_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tcw_database_1"
  }
}

resource "aws_subnet" "tcw_database_2" {
  vpc_id            = aws_vpc.tcw_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tcw_database_2"
  }
}

resource "aws_security_group" "tcw_sg" {
  name   = "tcw_security_group"
  vpc_id = aws_vpc.tcw_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tcw_security_group"
  }
}

resource "aws_internet_gateway" "tcw_igw" {
  vpc_id = aws_vpc.tcw_vpc.id

  tags = {
    Name = "tcw_igw"
  }
}

resource "aws_route_table" "tcw_rt" {
  vpc_id = aws_vpc.tcw_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tcw_igw.id
  }

  tags = {
    Name = "tcw_route_table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tcw_database_1.id
  route_table_id = aws_route_table.tcw_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.tcw_database_2.id
  route_table_id = aws_route_table.tcw_rt.id
}

#This VPC code is working fine.

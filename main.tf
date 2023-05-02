resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_1
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_2
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "rta_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.to_internet_gateway.id
}

resource "aws_route_table_association" "rta_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.to_internet_gateway.id
}

resource "aws_route_table" "to_internet_gateway" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.public_subnet_1a.id,aws_subnet.public_subnet_1b.id]

  tags = {
    Name= "RDS default subnet"
  }
}

resource "aws_db_instance" "instance_rds" {
  allocated_storage   = var.allocated_storage
  db_name             = var.rds_db_name
  engine              = var.engine
  instance_class      = "db.t3.micro"
  username            = var.rds_username
  password            = var.rds_password
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible = true
}
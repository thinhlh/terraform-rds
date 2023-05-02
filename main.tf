resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true
}

resource "aws_db_instance" "instance_rds" {
  allocated_storage   = var.allocated_storage
  db_name             = var.rds_db_name
  engine              = var.engine
  instance_class      = "db.t2.micro"
  username            = var.rds_username
  password            = var.rds_password
  skip_final_snapshot = true
}
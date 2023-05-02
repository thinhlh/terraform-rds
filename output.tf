output "rds_ip"{
  description = "RDS public IP Address"
  value = aws_db_instance.instance_rds.address
}

output "rds_port"{
  description = "RDS public port"
  value = aws_db_instance.instance_rds.port
}
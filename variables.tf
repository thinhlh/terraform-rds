variable "subnet_cidr" {
  description = "Subnet CIDR for instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "engine" {
  description = "RDS engine"
  type        = string
}

variable "rds_db_name" {
  description = "RDS database name"
  type        = string
}

variable "rds_username" {
  description = "RDS username"
  type        = string
}

variable "rds_password" {
  description = "RDS password"
  type        = string
}

variable "allocated_storage"{
    description = "Allocated storage"
    type = number
}
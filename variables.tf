variable "subnet_cidr_1" {
  description = "Subnet CIDR for instance in first subnet"
  type        = string
}

variable "subnet_cidr_2" {
  description = "Subnet CIDR for instance in second AZ"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet gateway id for making public"
  type = string
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
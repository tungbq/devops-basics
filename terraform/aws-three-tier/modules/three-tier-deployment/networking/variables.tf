variable "vpc_cidr" {
  type = string
}

variable "public_sn_count" {
  type = number
}

variable "private_sn_count" {
  type = number
}

variable "access_ip" {
  type = string
}

variable "db_subnet_group" {
  type = bool
}

variable "availabilityzone" {}

variable "azs" {}

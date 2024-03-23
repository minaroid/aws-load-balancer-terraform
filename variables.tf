variable "region" {
  type    = string
  default = "us-east-1"
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block" {
  type    = string
  default = "us-east-1"
}

variable "private_subnets_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "public_subnets_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "ssh_public_key_location" {
  type    = string
  default = ""
}

variable "env" {
  type    = string
  default = "dev"
}

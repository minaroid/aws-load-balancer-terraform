variable "ubuntu_ami_id" {
  type    = string
  default = ""
}

variable "jumpbox_security_groups" {
  type    = list(string)
  default = []
  description = "jumbbox security groups"
}

variable "key_pair_name" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "private_subnets_ids" {
  description = "private subnets ids"
  type    = list(string)
  default = []
}


variable "public_subnets_ids" {
  description = "public subnets ids"
  type    = list(string)
  default = []
}
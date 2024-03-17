variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}

variable "vpc_id" {
  description = "vpc id"
}

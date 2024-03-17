variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "cidr_block" {
  type    = string
  default = "us-east-1"
}

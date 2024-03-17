variable "ubuntu_ami_id" {
  type    = string
  default = ""
}
 
variable "app_server_security_groups" {
  type    = list(string)
  default = []
  description = "app server security groups"
}

variable "key_pair_name" {
  type    = string
  default = ""
}
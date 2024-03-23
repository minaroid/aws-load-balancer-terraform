resource "aws_vpc" "custom-vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Custom VPC"
  }
}
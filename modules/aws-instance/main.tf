resource "aws_instance" "jumpbox-server-1a" {
  ami                         = var.ubuntu_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnets_ids[0]
  vpc_security_group_ids      = var.jumpbox_security_groups
  availability_zone           = var.availability_zones[0]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
  tags = {
    Name : "Jumbbox Server - 1A"
  }
}

resource "aws_instance" "jumpbox-server-1b" {
  ami                         = var.ubuntu_ami_id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnets_ids[1]
  vpc_security_group_ids      = var.jumpbox_security_groups
  availability_zone           = var.availability_zones[1]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
  tags = {
    Name : "Jumbbox Server - 1B"
  }
}
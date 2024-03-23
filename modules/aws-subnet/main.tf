resource "aws_subnet" "public-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "Public-1A"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "Public-1B"
  }
}


resource "aws_subnet" "private-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "Private-1A"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "Private-1B"
  }
}

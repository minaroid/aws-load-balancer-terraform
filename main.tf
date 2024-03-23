provider "aws" {
  region = var.region
}

module "aws-vpc" {
  source             = "./modules/aws-vpc"
  cidr_block         = var.vpc_cidr_block
  availability_zones = var.availability_zones
}

module "aws-internet-gateway" {
  source = "./modules/aws-internet-gateway"
  vpc_id = module.aws-vpc.vpc_id
}

module "aws-subnet" {
  source              = "./modules/aws-subnet"
  private_cidr_blocks = var.private_subnets_cidr_blocks
  public_cidr_blocks  = var.public_subnets_cidr_blocks
  availability_zones  = var.availability_zones
  vpc_id              = module.aws-vpc.vpc_id
}

module "aws-nat-gateway" {
  source             = "./modules/aws-nat-gateway"
  public_subnets_ids = module.aws-subnet.public_subnets_ids
}

module "aws-route-table" {
  source              = "./modules/aws-route-table"
  private_subnets_ids = module.aws-subnet.private_subnets_ids
  public_subnets_ids  = module.aws-subnet.public_subnets_ids
  vpc_id              = module.aws-vpc.vpc_id
  igw_id              = module.aws-internet-gateway.igw_id
  nat_gateways_ids    = module.aws-nat-gateway.nat_ids
}

# module "aws-security-group" {
#   source = "./modules/aws-security-group"
#   vpc_id = module.aws-vpc.vpc_id
# }

# module "aws-key-pair" {
#   source                  = "./modules/aws-key-pair"
#   ssh_public_key_location = var.ssh_public_key_location
# }

# module "aws-ami" {
#   source  = "./modules/aws-ami"
# }

# module "aws-instance" {
#    source = "./modules/aws-instance"  
#    ubuntu_ami_id              = module.aws-ami.ubuntu_ami_id
#    jumpbox_security_groups    = module.aws-security-group.jumpbox_security_groups
#    private_subnets_ids        = module.aws-subnet.private_subnets_ids
#    public_subnets_ids         = module.aws-subnet.public_subnets_ids
#    key_pair_name              = module.aws-key-pair.app-key-name
#    availability_zones         = var.availability_zones
# }

# module "aws-lb" {
#   source = "./modules/aws-lb"
#   alb_security_groups        = module.aws-security-group.alb_security_groups
#   public_subnets_ids         = module.aws-subnet.public_subnets_ids
# }

# module "aws-lb-target-group" {
#   source = "./modules/aws-lb-target-group"
#   vpc_id = module.aws-vpc.vpc_id
# }

# module "aws-lb-listener" {
#   source = "./modules/aws-lb-listener"
#   app_alb_arn = module.aws-lb.app_alb_arn
#   app_target_group_arn = module.aws-lb-target-group.app_target_group_arn
# }

# module "aws-lb-roule" {
#   source = "./modules/aws-lb-listener-roule"
#   app_alb_listener_arn = module.aws-lb-listener.app_alb_listener_arn
#   app_target_group_arn = module.aws-lb-target-group.app_target_group_arn
# }

# module "aws-launch-configuration" {
#   source                     = "./modules/aws-launch-configuration"
#   key_pair_name              = module.aws-key-pair.app-key-name
#   ubuntu_ami_id              = module.aws-ami.ubuntu_ami_id
#   app_server_security_groups = module.aws-security-group.app_server_security_groups
# }

# module "aws-autoscaling-group" {
#   source  = "./modules/aws-autoscaling-group"
#   private_subnets_ids = module.aws-subnet.private_subnets_ids
#   app_launch_configuration_id = module.aws-launch-configuration.app_launch_configuration_id
#   app_target_group_arn = module.aws-lb-target-group.app_target_group_arn
# }
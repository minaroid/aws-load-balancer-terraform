resource "aws_lb" "app-alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = var.alb_security_groups 
  subnets         = var.public_subnets_ids

  tags = {
    Name = "app-alb"
  }
}

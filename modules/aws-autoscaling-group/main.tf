resource "aws_autoscaling_group" "app-asg" {
  name                 = "app-asg"
  launch_configuration = var.app_launch_configuration_id
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = var.private_subnets_ids

  target_group_arns = [var.app_target_group_arn]

  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "app-instance"
    propagate_at_launch = true
  }
}
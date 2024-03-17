resource "aws_launch_configuration" "app-launch-config" {
  name               = "app-launch-config"
  image_id           = var.ubuntu_ami_id
  instance_type      = "t2.micro"
  security_groups    = var.app_server_security_groups 
  key_name           = var.key_pair_name
  user_data          = "${file("entry-script.sh")}"  
  lifecycle {
    create_before_destroy = true
  }
}
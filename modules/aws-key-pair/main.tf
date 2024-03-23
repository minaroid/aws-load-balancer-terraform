resource "aws_key_pair" "app-ssh-key" {
  key_name   = "app-key-pair"
  public_key = file(var.ssh_public_key_location)
}

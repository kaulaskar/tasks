##########ec2-instance#################
resource "aws_instance" "server-1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id 
  vpc_security_group_ids      = [var.securitygroup_id]
  associate_public_ip_address = true
  tags = {
    Name       = var.server_name
  }
}

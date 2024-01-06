module "network" {
  source      = "../modules/network"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.0.0/24"
  allow_all   = "0.0.0.0/0"
  rt_cidr     = "0.0.0.0/0"
  az          = "ap-south-1a"
  region      = "ap-south-1"

}

module "sg" {
  source        = "../modules/sg"
  vpc_id        = module.network.vpc_id
  service_ports = [22, 8080]
}

module "ec2" {
  source           = "../modules/ec2"
  server_name      = "server"
  ami              = "ami-0f5ee92e2d63afc18"
  instance_type    = "t2.micro"
  key_name         = "desktop-key"
  subnet_id        = module.network.public_subnets_id
  securitygroup_id = module.sg.sg_id
  server_ip =  module.ec2.server_ip
  # key_path      = "./private_key.pem"

}

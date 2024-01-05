module "module" {
  # source = "git::https://github.com/ankit20000/DevOpsSRE-PROJECT.git?ref=sailesh_terraform_module"
  source        = "./module"
  vpc_cidr      = "10.0.0.0/16"
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name      = "desktop-key"
  subnet_cidr   = "10.0.0.0/24"
  allow_all     = "0.0.0.0/0"
  rt_cidr       = "0.0.0.0/0"
  az            = "ap-south-1a"
  server_name   = "server"
  egress        = [0]
  ingress       = [22,8080]
  region        = "ap-south-1"
  # key_path      = "./private_key.pem"

}

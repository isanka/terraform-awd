module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  project_name = var.project_name
}

module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  project_name      = var.project_name
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.subnet.subnet_id
  instance_type  = "t2.micro"  # Free Tier
  project_name   = var.project_name
  key_pair_name  = "ishanka-devops-key"
  security_group_ids = [module.ssh_sg.sg_id]
}

module "ssh_sg" {
  source       = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.vpc.public_route_table_id
}

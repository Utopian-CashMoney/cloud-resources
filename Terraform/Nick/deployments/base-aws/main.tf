
module "networking" {
  source = "../../modules/aws/networking"

  environment          = terraform.workspace
  vpc_cidr_block       = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnet_cidrs = ["10.1.2.0/24", "10.1.3.0/24"]
}

module "load_balancer" {
  source = "../../modules/aws/load-balancer"

  environment   = terraform.workspace
  cashmoney_vpc = module.networking.cashmoney_vpc
  subnet_ids    = module.networking.public_subnet_ids
  is_private    = false
}


module "networking" {
  source = "../../modules/networking"
}

module "load_balancer" {
  source = "../../modules/load-balancer"

  private_subnet_ids = module.networking.private_subnet_ids
}

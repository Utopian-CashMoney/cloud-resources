
module "networking" {
  source = "../../modules/networking"

  subnet_zone_1 = "${var.aws_region}a"
  subnet_zone_2 = "${var.aws_region}b"
}

module "load_balancer" {
  source = "../../modules/load-balancer"

  cashmoney_vpc      = module.networking.cashmoney_vpc
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids
}

module "cluster" {
  source = "../../modules/ecs-cluster"

  cluster_name = var.cluster_name
}

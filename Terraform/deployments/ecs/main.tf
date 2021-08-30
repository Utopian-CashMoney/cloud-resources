
module "networking" {
  source = "../../modules/networking"
}

module "load_balancer" {
  source = "../../modules/load-balancer"

  private_subnet_ids = module.networking.private_subnet_ids
}

# ECS Cluster

module "cluster" {
  source = "../../modules/ecs-cluster"

  cluster_name = "cashmoney-microservices"
}

# Microservice ECS cluster services

module "user_ms" {
  source = "../../modules/ecs-service"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "user-ms"
  cluster_id              = module.cluster.cluster_id
  container_port          = 8000
  task_execution_role_arn = module.cluster.ecsExecution_arn
  alb_arn                 = module.load_balancer.alb_arn

  depends_on = [
    module.networking,
    module.cluster,
    module.load_balancer
  ]
}

module "loans_ms" {
  source = "../../modules/ecs-service"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "loans-ms"
  cluster_id              = module.cluster.cluster_id
  container_port          = 8020
  task_execution_role_arn = module.cluster.ecsExecution_arn
  alb_arn                 = module.load_balancer.alb_arn

  depends_on = [
    module.networking,
    module.cluster,
    module.load_balancer
  ]
}

module "branches_ms" {
  source = "../../modules/ecs-service"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "branches-ms"
  cluster_id              = module.cluster.cluster_id
  container_port          = 8080
  task_execution_role_arn = module.cluster.ecsExecution_arn
  alb_arn                 = module.load_balancer.alb_arn

  depends_on = [
    module.networking,
    module.cluster,
    module.load_balancer
  ]
}

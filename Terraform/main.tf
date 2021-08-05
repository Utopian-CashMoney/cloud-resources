
module "networking" {
  source = "./modules/networking"
}

/*
module "user_website" {
  source = "./modules/user-site"
}
*/

# Microservice ECS cluster services

module "accounts-ms" {
  source = "./modules/microservice-repository"

  service_name = "accounts-ms"
}

module "user-ms" {
  source = "./modules/microservice-repository"

  service_name = "user-ms"
}

module "loans-ms" {
  source = "./modules/microservice-repository"

  service_name = "loans-ms"
}

module "branches-ms" {
  source = "./modules/microservice-repository"

  service_name = "branches-ms"
}

module "ucm_lib" {
  source = "./modules/microservice-repository"

  service_name = "ucm_lib"
}

/*
module "user-ms" {
  source = "./modules/microservice"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "user-ms"
  cluster_id              = aws_ecs_cluster.microservices.id
  container_port          = 8000
  task_execution_role_arn = aws_iam_role.ecsExecution.arn
  alb_arn                 = aws_lb.alb.arn

  depends_on = [
    module.networking
  ]
}

module "loans-ms" {
  source = "./modules/microservice"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "loans-ms"
  cluster_id              = aws_ecs_cluster.microservices.id
  container_port          = 8020
  task_execution_role_arn = aws_iam_role.ecsExecution.arn
  alb_arn                 = aws_lb.alb.arn

  depends_on = [
    module.networking
  ]
}

module "branches-ms" {
  source = "./modules/microservice"

  cashmoney_vpc_id   = module.networking.cashmoney_vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
  public_subnet_ids  = module.networking.public_subnet_ids

  service_name            = "branches-ms"
  cluster_id              = aws_ecs_cluster.microservices.id
  container_port          = 8080
  task_execution_role_arn = aws_iam_role.ecsExecution.arn
  alb_arn                 = aws_lb.alb.arn

  depends_on = [
    module.networking
  ]
}
*/

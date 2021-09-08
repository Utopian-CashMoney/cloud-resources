
module "networking" {
  source = "./modules/networking"
}

module "ecs-templates" {
  source = "./modules/ecs-templates"
  depends_on = [aws_ecs_cluster.microservices]
}

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


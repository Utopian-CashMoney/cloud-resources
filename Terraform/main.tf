
module "networking" {
  source = "./modules/networking"
}

/*
module "user_website" {
  source = "./modules/user-site"
}
*/

# Microservice ECS cluster services

resource "aws_ecs_cluster" "microservices" {
  name = var.ms_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_iam_role" "ecsExecution" {
  name               = var.ecs_task_execution_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2-container-service-attachment" {
  role       = aws_iam_role.ecsExecution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ssm-managed-instance-attachment" {
  role       = aws_iam_role.ecsExecution.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_lb" "alb" {
  name               = "cashmoney-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = module.networking.private_subnet_ids
}

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

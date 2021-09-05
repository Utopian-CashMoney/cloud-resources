
output "vpc_id" {
  value = module.networking.cashmoney_vpc.id
}

output "alb_id" {
  value = module.load_balancer.alb.arn_suffix
}

output "cluster_arn" {
  value = module.cluster.cluster.arn
}

data "aws_caller_identity" "current" {}

locals {
  docker_env_file = <<-EOT
# This .env file is generated from the Terraform base infrastructure deployment

AWS_ACCOUNT_ID=${data.aws_caller_identity.current.account_id}
AWS_REGION=${var.aws_region}
ECS_VPC_ID=${module.networking.cashmoney_vpc.id}
ECS_ALB_ARN_AFFIX=${module.load_balancer.alb.arn_suffix}
ECS_CLUSTER_NAME=${module.cluster.cluster.name}
EOT
}

resource "local_file" "aws_env_file" {
  filename = "../../../Docker/Docker-Nick/ecs-ucm/.env"

  content = local.docker_env_file
}

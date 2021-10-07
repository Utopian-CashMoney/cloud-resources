
output "vpc_id" {
  description = "Networking VPC ID"
  value       = module.networking.cashmoney_vpc.id
}

output "alb_arn_suffix" {
  description = "Suffix of App Load Balancer ARN"
  value       = module.load_balancer.alb.arn_suffix
}

output "alb_dns" {
  description = "DNS name of App Load Balancer"
  value       = module.load_balancer.alb.dns_name
}

data "aws_caller_identity" "current" {}

locals {
  docker_env_file = <<-EOT
# This .env file is generated from the Terraform base infrastructure deployment

AWS_ACCOUNT_ID=${data.aws_caller_identity.current.account_id}
AWS_REGION=${var.aws_region}
ECS_VPC_ID=${module.networking.cashmoney_vpc.id}
ECS_ALB_ARN_AFFIX=${module.load_balancer.alb.arn_suffix}
EOT
}

resource "local_file" "aws_env_file" {
  filename = "../../../../Docker/Docker-Nick/ecs-ucm/.env"

  content = local.docker_env_file
}

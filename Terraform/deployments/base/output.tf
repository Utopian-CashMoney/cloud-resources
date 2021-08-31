
output "vpc_id" {
  value = module.networking.cashmoney_vpc_id
}

output "alb_id" {
  value = module.load_balancer.alb_arn
}

output "cluster_arn" {
  value = module.cluster.cluster_arn
}

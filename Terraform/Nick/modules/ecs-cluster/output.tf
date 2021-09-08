
output "cluster_name" {
  value = var.cluster_name
}

output "cluster" {
  value = aws_ecs_cluster.microservices
}

output "ecsExecution_arn" {
  value = aws_iam_role.ecsExecution.arn
}

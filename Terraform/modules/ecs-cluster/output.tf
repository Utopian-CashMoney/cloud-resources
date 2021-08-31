
output "cluster_name" {
  value = var.cluster_name
}

output "cluster_id" {
  value = aws_ecs_cluster.microservices.id
}

output "cluster_arn" {
  value = aws_ecs_cluster.microservices.arn
}

output "ecsExecution_arn" {
  value = aws_iam_role.ecsExecution.arn
}

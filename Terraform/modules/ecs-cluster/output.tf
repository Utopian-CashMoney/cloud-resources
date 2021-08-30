output "cluster_id" {
  value = aws_ecs_cluster.microservices.id
}

output "ecsExecution_arn" {
  value = aws_iam_role.ecsExecution.arn
}

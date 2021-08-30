
variable "cluster_name" {
  type        = string
  description = "Name of ECS cluster."
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsExecutionRole"
}

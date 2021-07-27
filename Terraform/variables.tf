
variable "ms_cluster_name" {
  type    = string
  default = "cashmoney-microservices"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsExecutionRole"
}

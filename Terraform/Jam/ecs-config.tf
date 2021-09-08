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
  name               = "cashmoney-alb-jam"
  load_balancer_type = "application"
  subnets            = module.networking.private_subnet_ids
}

resource "aws_ecs_service" "test" {
  name                               = var.name
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.desired_count
  task_definition                    = aws_ecs_task_definition.nodeapp_graphite.arn
  launch_type                        = var.launch_type
  cluster                            = aws_ecs_cluster.oozou.id

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

}


resource "aws_ecs_cluster" "oozou" {
  name = "oozou"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


resource "aws_ecs_task_definition" "nodeapp_graphite" {
  family                   = "nodeapp-graphite"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"   
  memory                   = "2048"  

  container_definitions = jsonencode([
    {
      name      = "nodejs-app"
      image     = "osamariaz/oozou:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      environment = [
        {
          name  = "STATSD_HOST"
          value = "localhost"
        },
        {
          name  = "STATSD_PORT"
          value = "8125"
        }
      ]
    },
    {
      name      = "graphite"
      image     = "graphiteapp/graphite-statsd"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        },
        {
          containerPort = 2003
          hostPort      = 2003
          protocol      = "tcp"
        },
        {
          containerPort = 2004
          hostPort      = 2004
          protocol      = "tcp"
        },
        {
          containerPort = 2023
          hostPort      = 2023
          protocol      = "tcp"
        },
        {
          containerPort = 2024
          hostPort      = 2024
          protocol      = "tcp"
        },
        {
          containerPort = 8125
          hostPort      = 8125
          protocol      = "udp"
        },
        {
          containerPort = 8126
          hostPort      = 8126
          protocol      = "tcp"
        }
      ]
    }
  ])
}

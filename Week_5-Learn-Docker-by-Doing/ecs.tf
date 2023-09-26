# ECS
resource "aws_ecs_cluster" "django_cluster" {
  name = "django-docker"
}

resource "aws_ecs_task_definition" "django_docker_task" {
  family                   = "django_docker_task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "django_docker_task",
      "image": "${aws_ecr_repository.django_docker.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8000,
          "hostPort": 8000
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  depends_on               = [null_resource.ansible]
}

resource "aws_ecs_service" "app_service" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.django_cluster.id
  task_definition = aws_ecs_task_definition.django_docker_task.arn
  launch_type     = "FARGATE"
  desired_count   = 2

  load_balancer {
    target_group_arn = aws_lb_target_group.as_group.arn
    container_name   = aws_ecs_task_definition.django_docker_task.family
    container_port   = 8000
  }

  network_configuration {
    subnets          = module.vpc.public_subnets
    assign_public_ip = true
    security_groups  = [aws_security_group.App_security.id]
  }
}

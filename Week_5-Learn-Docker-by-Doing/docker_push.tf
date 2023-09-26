# Docker
resource "docker_registry_image" "django" {
  name = docker_image.django.name
}

resource "docker_image" "django" {
  name = "${aws_ecr_repository.django_docker.repository_url}:latest"
  build {
    context    = "docker/"
    dockerfile = "Dockerfile"
  }
  depends_on = [aws_ecr_repository.django_docker, local_file.settings]
}

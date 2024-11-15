
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "example-nginx"
  ports {
    internal = 80
    external = 8000
  }
}

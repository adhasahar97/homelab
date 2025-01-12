variable "release_name" {
  description = "The name of the Helm release"
  type        = string
}

variable "chart" {
  description = "The Helm chart name"
  type        = string
}

variable "repository" {
  description = "The Helm repository URL"
  type        = string
}

variable "namespace" {
  description = "The Kubernetes namespace to deploy the Helm release"
  type        = string
}

variable "chart_version" {
  description = "The version of the Helm chart"
  type        = string
}

variable "values" {
  description = "The values to pass to the Helm chart"
  type        = string
}
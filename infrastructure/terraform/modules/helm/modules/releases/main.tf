resource "helm_release" "release" {
    name             = var.release_name
    repository       = var.repository
    chart            = var.chart
    version          = var.chart_version
    namespace        = var.namespace
    create_namespace = true

    values = [var.values]
}

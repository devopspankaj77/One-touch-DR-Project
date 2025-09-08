# Prometheus Stack (with alerting enabled)
resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = var.monitoring_namespace
  create_namespace = true

  values = [
    file("${path.module}/values-prometheus.yaml"),
    file("${path.module}/values-alerts.yaml")
  ]
}

# Grafana
resource "helm_release" "grafana" {
  name             = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  namespace        = var.monitoring_namespace
  create_namespace = true

  values = [
    file("${path.module}/values-grafana.yaml")
  ]
}

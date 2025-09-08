resource "kubernetes_namespace" "microshop" {
  metadata {
    name = "microshop"
  }
}

resource "kubernetes_manifest" "app" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/deployment.yaml"))
}

resource "kubernetes_manifest" "svc" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/service.yaml"))
}

resource "helm_release" "vault-operator" {
  count            = var.install_vault ? 1 : 0
  name             = "vault-operator"
  chart            = "vault-operator"
  namespace        = "jx-vault"
  repository       = "https://kubernetes-charts.banzaicloud.com"
  version          = "1.14.3"
  create_namespace = true

  set {
    name = "resources.limits.memory"
    value = "512Mi"
  }
  set {
      name = "resources.requests.memory"
      value = "256Mi"
    }
}

resource "helm_release" "vault-instance" {
  count      = var.install_vault ? 1 : 0
  name       = "vault-instance"
  chart      = "vault-instance"
  namespace  = "jx-vault"
  repository = "https://jenkins-x-charts.github.io/repo"
  version    = "1.0.27"
  
  set {
    name = "pvc.size"
    value = "2Gi"
  }
  depends_on = [helm_release.vault-operator]
}

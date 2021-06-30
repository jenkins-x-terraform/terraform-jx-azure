resource "helm_release" "jx-git-operator" {
  name             = "jx-git-operator"
  chart            = "jx-git-operator"
  namespace        = "jx-git-operator"
  repository       = "https://jenkins-x-charts.github.io/repo"
  version          = "0.0.190"
  create_namespace = true

  set {
    name  = "bootServiceAccount.enabled"
    value = true
  }
  set {
    name  = "env.NO_RESOURCE_APPLY"
    value = true
  }
  set {
    name  = "url"
    value = var.jx_git_url
  }
  set {
    name  = "username"
    value = var.jx_bot_username
  }
  set_sensitive {
    name  = "password"
    value = var.jx_bot_token
  }
  dynamic "set_sensitive" {
    for_each = var.job_secret_env_vars
    content {
      name  = "jxBootJobEnvVarSecrets.${set_sensitive.key}"
      value = set_sensitive.value
    }
  }
  dynamic "set" {
    for_each = var.operator_annotations
    content {
      name  = "bootServiceAccount.annotations.${set.key}"
      value = set.value
    }
  }
}

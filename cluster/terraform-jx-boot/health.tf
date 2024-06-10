module "jx-health" {
  count               = var.install_kuberhealthy ? 1 : 0
  source              = "github.com/jenkins-x/terraform-jx-health?ref=main"
  jx_git_url          = var.jx_git_url
  jx_bot_username     = var.jx_bot_username
  jx_bot_token        = var.jx_bot_token
  tf_drift_secret_map = var.terraform_drift_secret_map
}

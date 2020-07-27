provider "scalr" {}

data "scalr_current_run" "current" {}
locals {
  run = data.scalr_current_run.current
}

resource "null_resource" "trigger" {
  triggers = {
    always_run = "${timestamp()}"
  }
}

output "id" {
  value = local.run.id
}
output "source" {
  value = local.run.source
}
output "message" {
  value = local.run.message
}
output "is_dry" {
  value = local.run.is_dry
}
output "workspace_name" {
  value = local.run.workspace_name
}
output "environment_id" {
  value = local.run.environment_id
}
output "vcs_branch" {
  value = local.run.vcs != null ? local.run.vcs[0].branch : null
}
output "vcs_repository" {
  value = local.run.vcs != null ? local.run.vcs[0].repository_id : null
}
output "vcs_commit_sha" {
  value = local.run.vcs != null ? local.run.vcs[0].commit[0].sha : null
}
output "vcs_commit_message" {
  value = local.run.vcs != null ? local.run.vcs[0].commit[0].message : null
}
output "vcs_commit_author" {
  value = local.run.vcs != null ? local.run.vcs[0].commit[0].author.username : null
}

locals {
  # env.hcl is in terragrunt/ (one level up from dev/)
  environment_vars = read_terragrunt_config("${get_terragrunt_dir()}/../env.hcl")

  raw_stage = local.environment_vars.locals.environment
  stage     = replace(replace(lower(trimspace(local.raw_stage)), "_", "-"), " ", "-")
}

terraform {
  # go up three levels from terragrunt/dev/k8s to repo root, then into terraform, then subdir k8s
  source = "${abspath("${get_terragrunt_dir()}/../../../terraform")}//k8s"
}


inputs = {
  stage = local.stage

  replica_count               = 2
  postgres_replica_count      = 3
  postgres_storage_size_in_gb = 1

  # NodePort configuration for dev environment
  nginx_node_port         = 30201
  url_shortener_node_port = 30301

  postgres_database           = "db"
  postgres_username           = "postgres"
  postgres_user_password      = "dev"
  postgres_password           = "dev"

  postgres_repmgr_database    = "repmgr"
  postgres_repmgr_username    = "repmgr"
  postgres_repmgr_password    = "dev"

  postgres_pgpool_admin_username = "admin"
  postgres_pgpool_admin_password = "dev"
}




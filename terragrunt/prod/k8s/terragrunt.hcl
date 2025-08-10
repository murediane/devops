locals {
  stage            = local.environment_vars.locals.environment
}

terraform {
  source = "../../terraform//k8s"
}

inputs = {
  stage = local.stage

  replica_count = 3

  postgres_replica_count      = 5
  postgres_storage_size_in_gb = 1

  postgres_database = "db"
  postgres_password = "prod"

  postgres_username = "postgres"
  postgres_user_password = "prod"

  postgres_repmgr_database = "repmgr"
  postgres_repmgr_username = "repmgr"
  postgres_repmgr_password = "prod"

  postgres_pgpool_admin_username = "admin"
  postgres_pgpool_admin_password = "prod"
}
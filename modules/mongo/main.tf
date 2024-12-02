terraform {
  required_providers {
    mongodbatlas      = {
      source          = "mongodb/mongodbatlas"
      version         = "1.21.4"
    }
  }
}

resource "mongodbatlas_database_user" "fiap_dbs" {
  username           = "masteruser"
  password           = "M45t3rp455"
  project_id         = mongodbatlas_project.order_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "order_db"
  }

  roles {
    role_name     = "readWrite"
    database_name = "production_db"
  }

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }

  labels {
    key   = "Name"
    value = "MongoDB Atlas - FIAP Databases"
  }

  scopes {
    name   = "fiap-cluster"
    type = "CLUSTER"
  }
}

resource "mongodbatlas_project" "order_project" {
  name             = "fast-food"
  org_id           = var.organization_id
}

resource "mongodbatlas_cluster" "order_cluster" {
  project_id                    = mongodbatlas_project.order_project.id
  name                          = "fiap-cluster"
  provider_name                 = "TENANT"
  backing_provider_name         = "AWS"
  provider_region_name          = "US_EAST_1"
  provider_instance_size_name   = "M0"
  retain_backups_enabled        = false
  cloud_backup                  = false
  termination_protection_enabled = false
}

resource "mongodbatlas_project_ip_access_list" "open_access" {
  project_id = mongodbatlas_project.order_project.id
  cidr_block = "0.0.0.0/0"
  comment    = "Open Access"
}
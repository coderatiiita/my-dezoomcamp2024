terraform {
    required_version = ">= 1.0"
    backend "local" {}
    required_providers {
      google = {
        source = "hashicorp/google"
      }
    }
}

provider "google" {
    project = var.project
    region = var.region
}

resource "google_storage_bucket" "data-lake-bucket" {
    name = "${local.data_lake_bucket}_${var.project}"
    location = var.region
    force_destroy = true

    storage_class = var.storage_class
    uniform_bucket_level_access = true

    versioning {
      enabled = true
    }

    lifecycle_rule {
      action {
        type = "Delete"
      }
      condition {
        age = 30
      }
    }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.BQ_DATASET
  location   = var.region
}
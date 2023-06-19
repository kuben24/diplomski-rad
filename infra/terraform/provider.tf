terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.62.1"
    }
  }
  backend "gcs" {
    bucket = "tfstate-diplomski"
    credentials = "./sa_key.json"
  }
}

provider "google" {
  project     = var.GCP_PROJECT
  credentials = "./sa_key.json"
}
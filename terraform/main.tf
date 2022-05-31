terraform {
 required_providers {
   yandex = {
     version = "0.74.0"
   }
  }
required_version = ">= 1.1.5"
  backend "s3" {
    bucket                      = "TERRAFORM-CONFIG-BUCKET-NAME"
    endpoint                    = "https://storage.yandexcloud.net"
    key                         = "RUNNER_NAME/terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}


provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

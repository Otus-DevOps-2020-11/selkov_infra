terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "reddit-app-states"
    region     = "ru-central1"
    key        = "terraform-prod.tfstate"
    access_key = "AJ4OGudjiN9vHcHoYoZz"
    secret_key = "30je8_HYkS7BwNRc7GRs2y82e4Mt2ca3pZ1Ar1ot"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

terraform {
  backend "s3" {
    bucket = "jeferson-alura-terraform-state"
    key    = "production/terraform.tfstate"
    region = "us-east-2"
  }
}

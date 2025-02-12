terraform {
  backend "s3" {
    bucket = "jeferson-alura-terraform-state"
    key    = "homolog/terraform.tfstate"
    region = "us-east-2"
  }
}

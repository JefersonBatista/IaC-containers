module "production" {
  source      = "../../infra"
  name        = "production"
  description = "Production application"
  environment = "production-env"
  machine     = "t2.micro"
  max_size    = 5
}

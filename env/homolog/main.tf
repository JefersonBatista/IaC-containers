module "homolog" {
  source      = "../../infra"
  name        = "homolog"
  description = "Homolog application"
  environment = "homolog-env"
  machine     = "t2.micro"
  max_size    = 3
}

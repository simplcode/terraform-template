/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws
*/

module "sg_web_http" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 3.2"

  name                = "web-http"
  description         = "Security group for web-server with HTTP ports open to public"
  vpc_id              = module.vpc_main.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_web_https" {
  source = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "~> 3.2"

  name                = "web-https"
  description         = "Security group for web-server with HTTPS ports open to public"
  vpc_id              = module.vpc_main.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "sg_ssh" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.2"

  name                = "ssh"
  description         = "Security group for ssh-server with default ssh port open to public"
  vpc_id              = module.vpc_main.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
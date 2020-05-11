provider "aws" {
  version = "~> 2.0"
  profile = var.profile
  region  = var.region
}

#################### Data ####################

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_acm_certificate" "domain" {
  domain   = "*.${var.domain}"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "domain" {
  name = var.domain
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}
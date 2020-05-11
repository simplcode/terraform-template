/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
*/
module "vpc_main" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = merge(var.tags,
  {
    Name        = var.name
  })
}
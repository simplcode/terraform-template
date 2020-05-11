/*
Hashicorp Verified Module
https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws
*/
module "bastion" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "bastion"
  instance_count         = 1

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.ssh-key
  monitoring             = true
  vpc_security_group_ids = [module.sg_ssh.this_security_group_id]
  subnet_ids              = module.vpc_main.public_subnets

  tags = merge(var.tags,
  {
    Name = "bastion-${var.env}"
  })
}

resource "aws_eip" "bastion" {
  instance = module.bastion.id[0]
  vpc = true
}

resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name = "bastion-${var.env}"
  type = "A"
  ttl = "300"
  records = [aws_eip.bastion.public_ip]
}
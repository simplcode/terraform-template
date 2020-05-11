variable "env" {
  default     = "dev"
  description = "dev / test / production"
}

variable "profile" {
  default     = "default"
  description = "this must be matched with region variable"
}

variable "region" {
  default     = "us-east-1"
  description = "default profile uses us-east-1"
}

variable "name" {
  default     = ""
  description = "infrastructure name"
}

variable "domain" {
  description = "root domain address for services"
}

variable "tags" {
  type = map(string)
}

variable "ssh-key" {
  description = "ssh key name for ec2 instances"
}

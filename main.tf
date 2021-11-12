terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = var.region
}

data "template_file" "user_data" {
  template = file("${path.module}/install_riot.yml")
}

resource "aws_instance" "riot" {
  ami                         = var.linux_ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  vpc_security_group_ids      = [var.security_group_id]
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "RIOT"
  }
}


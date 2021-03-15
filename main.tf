terraform {
  required_version = "~> 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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

output "run_riot" {
  value = "ssh -i ~/.ssh/${var.ssh_key_name}.pem ec2-user@${aws_instance.riot.public_ip} /ussr/local/bin/riot-redis"
}
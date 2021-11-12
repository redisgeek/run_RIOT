locals {
  host    = aws_instance.riot.public_ip
  user    = "ec2-user"
  program = "/usr/local/bin/riot-redis"
}

output "host" {
  value       = local.host
  description = "Public IP for riot instance"
}

output "user" {
  value       = local.user
  description = "user with access to host"
}

output "program" {
  value       = local.program
  description = "Absolute path to program on host"
}

output "run_riot" {
  value       = "ssh -i ~/.ssh/${var.ssh_key_name}.pem ${local.user}@${local.host} ${local.program}"
  description = "ssh string to execute riot-redis on target ec2 instance"
}

output "run_riot_old" {
  value       = "ssh -i ~/.ssh/${var.ssh_key_name}.pem ec2-user@${aws_instance.riot.public_ip} /usr/local/bin/riot-redis"
  description = "ssh string to execute riot on target ec2 instance"
}

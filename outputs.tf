output "run_riot" {
    value = "ssh -i ~/.ssh/${var.ssh_key_name}.pem ec2-user@${aws_instance.riot.public_ip} /ussr/local/bin/riot-redis"
    description = "ssh string to execute riot on target ec2 instance"
}

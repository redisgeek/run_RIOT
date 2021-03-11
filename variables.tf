variable "region" {
    description = "Region into which to deploy the EC2 instance"
}

variable "ami" {
    description = "AMI"
}

variable "instance_type" {
    description = "instance type to use. Default: t3.micro"
}

variable "ssh_key_name" {
    description = "name of ssh key to be added to instance"
}

variable "security_group_id" {
    description = "Id of the security group applied to the instance"
}



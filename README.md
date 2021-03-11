# RIOT Instance
A simple terraform module to create an EC2 instance that will run [RIOT](https://developer.redislabs.com/riot/riot-redis.html)

# To use
Clone this repo:

```
git clone https://github.com/Redislabs-Solution-Architects/run_RIOT.git
cd run_RIOT
```

Initialize terraform:
```
terraform init
```

Configure variables - best done by writing them into a file called `terraform tfvars`, but if you don't you'll be prompted for them.

Plan and execute:
```
terraform plan
terraform apply
```

The output gives you the string to run to execute riot-redis locally (assuming your ssh keyname can be converted to the path to the key file!). Here's an example:

```
run_riot = "ssh -i ~/.ssh/toby-kp.pem ec2-user@3.235.224.142 /usr/local/bin/riot-redis"
```

# CAVEATS
- AWS/EC2 specific only
- Expects a linux distro

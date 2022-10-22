provider "aws" {
  region = "us-east-1"
  access_key = "eeeKIA4YIACT6ZQ5S63QEA-0000"
  secret_key = "4dsdf2YUlNoaMT7nJsFLP6T+8sy3aVV415nDAppik-0000"
  sensitive = true
}

# variable "user_information" {
#   type = object({
#     name    = string
#     address = string
#   })
#   sensitive = true
# }

# resource "some_resource" "a" {
#   name    = var.user_information.name
#   address = var.user_information.address
# }



module "single_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-09d3b3274b6c5d4aa"
  instance_type          = "t2.micro"
  key_name               = "MyLinuxKeyPair"
  monitoring             = true
  vpc_security_group_ids = ["sg-00aa022074847f772"]
  # subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
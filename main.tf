terraform {
  required_providers {
    aws = {
      #   region = var.region
     source = "hashicorp/aws"
     version = "~> 5.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
  #   vpc_cidr = var.vpc_cidr
}

module "cloudtrail" {
  source = "./modules/cloudtrail"
}

#Added iam password policy
module "aws_iam_password_policy" {
  source = "./modules/aws_iam_password_policy"
}

#Adding iam module from other group work
module "iam-extended" {
  source = "./modules/aws_iam"
}

#Adding IPAM modeule from other group work
module "aws_ipam" {
  source = "./modules/aws_ipam"
  auto_import = true
}

#Added Trusted Advisor
#module "aws_trusted_advisor" {
#  source = "./modules/aws_trusted_advisor"
#}
#
#module "aws_config" {
#  source = "./modules/aws_config"
#  awsconfig-bucket-name = "cmmc-config"
#  aws_server_access_logging_bucket = ""
#}

module "aws_groups" {
  source = "./modules/aws_groups"
}

module "ec2" {
  source = "./modules/ec2"
}

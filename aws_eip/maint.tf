# Terraform configuration

terraform {
  backend "s3" {
    bucket = "my-ezbrew-state-store"
    key    = "terraform/eip"
    encrypt = true
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "eip" {
  source  = "./modules/terraform_aws_eip"
  count = "${length(data.aws_availability_zones.available.names)}"
  name = "${data.aws_availability_zones.available.names[count.index]}"
  
}


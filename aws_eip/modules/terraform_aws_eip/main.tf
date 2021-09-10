# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#     }
#   }
# }

resource "aws_eip" "eip-module" {
  tags = {
    Name = "${var.name}"
  }
}
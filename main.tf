terraform {
  backend "local" {}
  required_version = ">= 0.14"
}

provider "aws" {
  region = "ap-south-1"
  access_key = ""
	secret_key = ""
}

locals {
  system_name = "vouch-operations"
}

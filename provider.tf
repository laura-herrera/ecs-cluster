# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}

data "terraform_remote_state" "remote_state" {
    backend = "s3"
    config {
        bucket = "mycompany-terraform-state"
        key = "terraform/mycluster-dev.tfstate"
        region = "${var.region}"
    }
}


terraform {
  backend "s3" {
    bucket = "mycompany-terraform-state"
    key = "terraform/mycluster-dev.tfstate"
    region = "${var.region}"
  }
}

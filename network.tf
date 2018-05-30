module "network" {
  source = "../modules/network"

  vpc_cidr = "${var.vpc_cidr}"
  public_subnet_cidrs =  "${var.public_subnet_cidrs}" 
  private_subnet_cidrs =  "${var.private_subnet_cidrs}" 

  cluster_name = "${var.cluster_name}"
  environment = "${var.environment}"
  internal_domain_aws = "${var.internal_domain_aws}"
  availability_zones = "${var.availability_zones}"
  availability_zone_count = "${var.availability_zone_count}"
}

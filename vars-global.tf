variable "cluster_name" {
  description = "Terraform for TEST cluster"
  default = "test"
}

variable "environment" {
  description = "Environment"
  default = "dev"
}

variable vpc_cidr {
  default = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Assign the subnet's CIDRs"
  default = {
    "0" = "10.20.10.0/24"
    "1" = "10.20.11.0/24"
  }
}

variable "private_subnet_cidrs" {
  description = "Private subnets"
  default = {
    "0" = "10.20.20.0/24"
    "1" = "10.20.21.0/24"
  }
}

variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "availability_zone_count" {
  description = "Number of Availability Zones"
  default = "2"
}

variable "availability_zones" {
  description = "Availability Zones"
  default = {
    "0" = "eu-west-1a"
    "1" = "eu-west-1b"
  }
}

variable "ecs_instance_type" {
  description = "ECS instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "ssh key"
  default = "key-pair-eu-west"
}

variable "internal_domain_aws" {
  description = "Internal Domain Name in AWS"
  default = "eu-west-1.compute.internal"
}

variable "ext_domain" {
  description = "Top-level domain name"
  default     = "mycompany.com"
}

variable "int_domain" {
  description = "Internal domain name"
  default     = "internal.mycompany.com"
}

variable "public_zone_id" {
  description = "Public Zone to add DNS records"
  default = "##Route 53 id ##"
}

variable "private_zone_id" {
  description = "Private Zone to add DNS records"
  default = "##Route 53 id"
}

variable "dns_ttl" {
  description = "DNS TTL to use for records"
  default     = "300"
}

/* AMI ID ecs-optimized to use */
variable "ecs_amis" {
  description = "Base AMI: amzn-ami-...-ecs-optimized"
  default = {
    "eu-west-1a" = "ami-XXXXXXXX"
  }
}

variable "docker_registry" {
  description = "Docker ECR registry URL"
  default = "############.dkr.ecr.eu-west-1.amazonaws.com"
}

variable "lambda_function_env_vars" {
  description = "Environment Variables for the Lambda function to run"
  default = {
    service = "test-service"
    env = "dev"
  }
}

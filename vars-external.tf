/* This are external resources needed by the current cluster */
variable "SSM_policy" {
  description = "SSM policy arn to attach to instance role "
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
variable "ECR_RO_policy" {
  description = "ECR RO policy arn to attach to instance role "
  default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
variable "CW_LOGS_policy" {
  description = "CW LOGS policy arn to attach to instance role "
  default = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
variable "ECS_policy" {
  description = "ECS policy arn to attach to instance role "
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}
variable "CW_CM_policy" {
  description = "CW policy for Custom Metrics arn to attach to instance role"
  default = "##ARN for a policy to access Custom Metrics ##"
}
variable "sched_cont_lambda_function" {
  description = "Lambda Function to monitor resources for Auto Scaling"
  default ="${module.lambda.lambda_function_arn}"
}
variable "ssl_cert_internal_domain" {
  description = "SSL certificate for the internal domain"
  default ="##ARN for the internal domain certs ##"
}
variable "ssl_cert_external_domain" {
  description = "SSL certificate for the External domain"
  default ="##ARN for the external domain cert ##"
}

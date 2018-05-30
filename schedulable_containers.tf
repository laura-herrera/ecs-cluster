module "schedulable_containers" {
  source = "../modules/lambda"

  cluster_name = "${var.cluster_name}"
  environment = "${var.environment}"
  lambda_file_name = "files/autoscale.zip"
  lambda_function_name = "SchedulableContainers"
  lambda_function_handler = "lambda_handler"
  lambda_function_runtime = "python3.6"
  lambda_function_env_vars = "${var.lambda_function_env_vars}"
  lambda_function_role_name = "SchedulableContainersRole"
  policies = []
  add_inline_policy = false
  inline_policy_name = ""
  inline_policy_content = ""
}

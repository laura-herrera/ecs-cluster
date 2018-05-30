module "cluster" {
  source = "../modules/cluster"

  /* Global Vars */
  cluster_name = "${var.cluster_name}"
  environment = "${var.environment}"
  region = "${var.region}"

  /* ALB settings */
  alb_internal = true
  alb_external = false

  /* Backend Target Group Settings */
  protocol_btg = "HTTP"
  port_btg = 80

  /* Health Check Parameters for Backend Target Group*/
  healthy_threshold_btg_hc = 5
  unhealthy_threshold_btg_hc = 10
  path_btg_hc = "/"
  protocol_btg_hc = "HTTP"
  interval_btg_hc = 30
  timeout_btg_hc = 5
  
  /* AutoScaling Parameters */
  min_size = 1
  max_size = 2
  desired_capacity = 1
  health_check_grace_period = 300
  default_cooldown = 300
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  container_max_cpu = 100
  container_max_mem = 200
  alarm_period = 60
  low_alarm_periods = 2
  low_alarm_threshold = 2
  high_alarm_periods = 10
  high_alarm_threshold = 3
  event_rule_name = "MyClusterSchedulableContainersEvent"
  event_rule_schedule = "rate(5 minutes)"
  metric_name = "MyClusterSchedulableContainers"
  metric_namespace = "NAMESPACE/ECS"

  /* Auto Patching */
  enable_autopatch = true
  autopatch_metric = "OutdatedInstances"
  autopatch_metric_namespace = "NAMESPACE/Auto Scaling"
  autopatch_periods = 5
  autopatch_alarm_period = 60 

  /* External vars */
  docker_registry = "${var.docker_registry}"
  ECR_RO_policy = "${var.ECR_RO_policy}"
  SSM_policy = "${var.SSM_policy}"
  CW_LOGS_policy = "${var.CW_LOGS_policy}"
  CW_CM_policy = "${var.CW_CM_policy}"
  ECS_policy = "${var.ECS_policy}"
  key_name = "${var.key_name}"
  ecs_amis = "${var.ecs_amis}"
  ecs_instance_type = "${var.ecs_instance_type}"
  public_zone = "${var.public_zone_id}"
  private_zone = "${var.private_zone_id}"
  availability_zones = "${var.availability_zones}"
  default_vpc = "${module.network.default_vpc}"
  default_vpc_cidr = "${module.network.default_vpc_cidr}"
  public_subnets = "${module.network.public_subnets}"
  private_subnets = "${module.network.private_subnets}"
  public_sg = "${module.network.public_sg}"
  private_sg = "${module.network.private_sg}"
  private_az = "${module.network.private_az}"
  sched_cont_lambda_function = "${var.sched_cont_lambda_function}"
  ssl_cert_external_domain = "${var.ssl_cert_external_domain}"
  ssl_external_security_policy = "ELBSecurityPolicy-2016-08"
  ssl_cert_internal_domain = "${var.ssl_cert_internal_domain}"
  ssl_internal_security_policy = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

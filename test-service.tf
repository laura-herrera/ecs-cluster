module "test-service" {
  source = "../modules/service"

  /* Global and Extrnal Vars */
  cluster_name = "${var.cluster_name}"
  environment = "${var.environment}"
  region = "${var.region}"
  vpc_id = "${module.network.default_vpc}"
  service_name = "${var.service_name}-${var.environment}"
  tg_port = "${var.service_port}"
  tg_protocol = "${var.service_protocol}"
  log_group = "${var.service_name}-${var.environment}"
  log_retention = "${var.log_retention}"
  task_family = "${var.service_name}-${var.environment}"
  template_file = "${var.service_name}.json"
  ecr_repository_url = "${var.docker_registry}/${var.service_name}"
  ecr_repository_tag = ""
  desired_count = 2
  container_name = "${var.service_name}"
  container_port = "${var.service_port}"
  healthcheck_healthy = 5
  healthcheck_unhealthy = 10
  healthcheck_path = "/health/"
  healthcheck_protocol = "HTTP"
  healthcheck_interval = 10
  healthcheck_timeout = 5
  stick_enabled = false
  stick_type = "lb_cookie"
  stick_duration = 1
  iam_task_role = "TestSvcDevECSTaskRole"
  dns_zone_id = "${var.public_zone_id}"
  service_role = "${module.cluster.iam_svc_role}"
  is_internal = false
  service_url = "${var.service_name}-${var.environment}"
  service_domain = "${var.ext_domain}"
  alb_name = "${module.cluster.external_alb_name}"
  alb_zone = "${module.cluster.external_alb_zone}"
  alb_listener_443 = "${module.cluster.frontend_443_listener}"
  alb_listener_rule_priority = "${var.listener_rule_priority}"
  alb_listener_80 = "${module.cluster.frontend_80_listener}"
  cluster_id = "${module.cluster.ecs_cluster}"
  min_service_capacity = 1
  max_service_capacity = 2
  ecs_cluster_name = "${module.cluster.ecs_cluster_name}"
  svc_cpu_high = true
  svc_alarm_cpu_high_operator = "GreaterThanThreshold"
  svc_alarm_cpu_high_periods = 1
  svc_alarm_cpu_high_period_length = 60
  svc_alarm_cpu_high_threshold = 60
  svc_cpu_low = true
  svc_alarm_cpu_low_operator = "LessThanThreshold"
  svc_alarm_cpu_low_periods = 10
  svc_alarm_cpu_low_period_length = 60
  svc_alarm_cpu_low_threshold = 20

  create_db = true
  db_instance_name = "${var.service_name}-${var.environment}"
  db_engine_type = "postgres"
  db_engine_version = "9.6.6"
  db_storage_type = "gp2"
  db_storage_size = 5
  db_instance_class = "db.t2.small"
  db_name = "${var.service_name}_${var.environment}"
  db_username = "postgres"
  db_parameter_group = "default.postgres9.6"
  db_backup_retention_period = 3
  db_backup_window = "01:00-2:00"
  db_maintenance_window = "Wed:02:00-Wed:03:00"
  db_multi_az = true
  db_public = false
  owner = "Test Team"
  tool = "Sales"
  timezone = "GMT"
  private_subnets = "${module.network.private_subnets}"
  default_vpc = "${module.network.default_vpc}"
  default_vpc_cidr = "${module.network.default_vpc_cidr}"

  create_cf_distribution = true
  cf_dist_enabled = true
  cf_dist_ipv6 = true
  cf_dist_root_object = ""
  cf_dist_fw_query_string = false
  cf_dist_fw_headers = ["Access-Control-Request-Headers","Access-Control-Request-Method","Origin"]
  cf_dist_fw_cookies = "none"
  cf_dist_protocol_policy = "https-only"
  cf_dist_min_ttl = 0
  cf_dist_default_ttl = 86400
  cf_dist_max_ttl = 31536000
  cf_dist_price_class = "PriceClass_All"
  cf_dist_restriction_type = "none"
  cf_dist_restriction_locations = []
  cf_origin_http_port = 80
  cf_origin_https_port = 443
  cf_origin_protocol_policy = "match-viewer"
  cf_origin_ssl_protocols =  ["TLSv1", "TLSv1.1", "TLSv1.2"]
  cf_origin_keepalive_timeout = 5
  cf_origin_read_timeout =  30

  create_s3_bucket = true
  create_s3_bucket_user = true
  s3_bucket_name = "${var.service_name}-${var.environment}"
  cors_allowed_origins = [""]
  cors_allowed_headers = ["Origin","*"]
  cors_allowed_methods = ["HEAD","GET"]

  create_redis = true
  redis_name = "${var.service_name}-${var.environment}"
  redis_engine_version = "3.2.4"
  redis_node_type = "cache.t2.micro"
  redis_parameter_group = "default.redis3.2"
  redis_backup_window = ""
  redis_backup_retention_period = 0
  redis_maintenance_window = "sun:02:00-sun:03:00"
}

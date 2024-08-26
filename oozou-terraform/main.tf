module "vpc" {
  source = "./modules/vpc"

  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
  vpc_name = var.vpc_name
}

module "ecs" {
  source = "./modules/ecs"

  name             = var.name
  launch_type      = var.launch_type 
  # ecs_task_cpu     = var.ecs_task_cpu
  # ecs_task_memory  = var.ecs_task_memory
  subnets          = module.vpc.public_subnet_ids
  vpc_id = module.vpc.vpc_id
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count = var.desired_count
  assign_public_ip = var.assign_public_ip
  security_groups = module.vpc.security_groups

}

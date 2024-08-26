region = "us-east-1"

vpc_cidr = "172.20.0.0/24"

public_subnet_cidrs = [
  "172.20.0.0/28"
]

availability_zones = [
  "us-east-1a",
]

vpc_name = "oozouVPC"
name = "oozou"
deployment_minimum_healthy_percent= "80"
desired_count= "1"
launch_type = "FARGATE"
assign_public_ip = true

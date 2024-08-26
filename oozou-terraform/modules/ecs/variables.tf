variable "name" {
  description = "Name for the ECS service and cluster"
  type        = string
}

variable "deployment_minimum_healthy_percent" {
  description = "Minimum healthy percent for ECS service deployment"
  type        = number
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = number
}

variable "launch_type" {
  description = "The launch type on which to run your service"
  type        = string
}

variable "subnets" {
  description = "A list of subnet IDs to associate with the ECS service"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Assign a public IP to the ECS service"
  type        = bool
}

variable "vpc_id" {
  description = "Assign a public IP to the ECS service"
  type        = string
}

variable "security_groups" {
  description = "Assign a public IP to the ECS service"
  type        = list(string)
}

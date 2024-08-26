# VPC VARS

variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones in the region to create subnets"
  type        = list(string)
}

variable "vpc_name" {
  type = string
}




# ECS VARS

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

variable "assign_public_ip" {
  description = "Assign a public IP to the ECS service"
  type        = bool
}

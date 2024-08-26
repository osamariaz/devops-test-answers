variable "region" {
  description = "The AWS region to deploy the VPC in"
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
  description = "List of availability zones in the region"
  type        = list(string)
}
variable "vpc_name" {
  type = string
}
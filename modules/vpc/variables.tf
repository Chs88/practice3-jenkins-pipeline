variable "infra_env" {

    type = string

    description = "infrastructure environment"
}


variable "vpc_cidr" {

    description = "IP ranges to use for the VPC"
    default = "192.0.0.0/16"
}


variable "project_name" {
  
  type = string

  description = "The name of the project"
}
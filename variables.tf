variable "credentials_path" {
  type = list
}

variable "default_region" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "ec2_instance_type" {

    type = string

    description = "the type of the ec2 instance"

    default = "t2.micro"
}


variable "infra_env" {

  type = string

  description = "infrastructure environment"
}


variable "private_key_path"  {

  type = string

  description = "Path to where the private key is stored for SSH"

}

variable "project_name" {

  type = string

  description = "name of the project"
}
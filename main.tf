provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = "default"
}


module "jenkins-server" {

  source = "./modules/ec2"

  ec2_role = "jenkins-server"

  project_name = "Practice3"

  infra_env = "staging" ##just a placeholder to call it somehow

  subnet = aws_subnet.main_subnet.id


}
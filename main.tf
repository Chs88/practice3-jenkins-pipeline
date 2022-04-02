provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}

### Ec2 instane for the webserver that will receive a public IP

module "web_server" {
  
  source = "./modules/ec2"

  project_name = var.project_name

  infra_env = var.infra_env

  ec2_role = "web_server"

  subnet = module.vpc.vpc_public_subnet

  create_eip = true

  security_groups = ["${module.vpc.security_group_public}"]

  user_data = file("./scripts/webserver.sh")

  associate_public_ip_address = false

}

##Ec2 instance for the machine that will run our database

module "database" {

  source = "./modules/ec2"

  project_name = var.project_name

  infra_env = var.infra_env

  ec2_role = "database"

  subnet = module.vpc.vpc_private_subnet

  create_eip = false

  security_groups = ["${module.vpc.security_group_private}"]

  user_data = file("./scripts/database.sh")

  associate_public_ip_address = false
}

module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  infra_env = var.infra_env

  vpc_cidr = "192.0.0.0/17" ##I am going to half the default amount of IPs for now

  
}


##Jenkins Server resource

module "jenkins_server" {

  source = "./modules/ec2"

  project_name = var.project_name

  infra_env = var.infra_env

  ec2_role = "jenkins_server"

  subnet = module.vpc.vpc_private_subnet

  create_eip = false

  security_groups = ["${module.vpc.security_group_private}"]

  # user_data = file("./scripts/database.sh")

  associate_public_ip_address = true
  
}

## Going to use a little workaround to provision the private key to the webserver
# Using a null_resource will still trigger the provisioning 

resource "null_resource" "provisioner" {

  depends_on = [
    module.web_server
  ]

  provisioner "file" {

    source = var.private_key_path

    destination = "./key.pem"

      connection {    
        
        type     = "ssh"    

        user     = "ubuntu"

        # password = "${var.root_password}"    

        host     =  module.web_server.eip[0]

        private_key = file("${var.private_key_path}")
  
  }
  }

  provisioner "remote-exec" {

    inline = [
      "sudo chmod 600 key.pem"
    ]

    connection {    
        
        type     = "ssh"    

        user     = "ubuntu"

        # password = "${var.root_password}"    

        host     =  module.web_server.eip[0]

        private_key = file("${var.private_key_path}")
  
  }
    
  }

  
}

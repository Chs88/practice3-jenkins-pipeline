###TO DO: Change this module to be reusable and declare the instances in the root main.tf file. 
## add the subnets to the module in a reusable way


###test resource
resource "aws_instance" "project_instance" {
  ami           = data.aws_ami.ubuntu_ami.id 

  instance_type = var.ec2_instance_type

  subnet_id = var.subnet
  
  # security_groups = ""

  tags = { ##tag everything for easy code readability

    Name = "${var.project_name}-${var.infra_env}-${var.ec2_role}"

    Environment = var.infra_env

    Project = var.project_name

    ManagedBy = "Terraform"

    Role = var.ec2_role
  }

}

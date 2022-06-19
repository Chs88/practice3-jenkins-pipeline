# practice3-jenkins-pipeline
This practice was created using the existing infrastructure from [terraform-practice-dev](https://github.com/Chs88/terraform-practice-dev)
# Introduction
The difference between this project and the above mentioned existing infrastructure, is that this has an additional EC2 instance that is running a Jenkins build server that will build the PHP app running on the "Worker" node on an apache2 webserver. 

# .tfvars-file

The infrastructure expects the following variables to be declared in the tfvars file: 

credentials_path = [path/to/aws-cli/] - I used AWS cli to save my credentials. They can also be declared the following way: 

```
provider "aws" {
  region     = "eu-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

default_region = "eu-west-2" - Your AWS default region. 

profile_name = "default" - The profile name for the AWS cli. Leave blank if not used. 

infra_env = "dev" - The environment name. I used 'dev'. It is used for naming conventions. 

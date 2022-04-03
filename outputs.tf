
output "webserver_eip" {

  value = module.web_server.eip
  
}

output "database_ip" {
  
  value = module.database.private_ip

}

output "jenkins_priv_ip" {

  value = module.jenkins_server.private_ip
}

# output "jenkins_pub_ip" {

#   value = module.jenkins_server.public_ip

# }

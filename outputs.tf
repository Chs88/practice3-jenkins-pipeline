
output "webserver_eip" {

  value = module.web_server.eip
  
}

output "database_ip" {
  
  value = module.database.private_ip

}
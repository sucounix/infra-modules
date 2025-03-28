output "default_vpc" {
  value = data.aws_vpc.default_vpc.id
}

output "default_subnet" {
  value = data.aws_subnet.default_subnet.id
}

output "public_ip"{
  value = format("https://%s:943/admin/",aws_instance.open-vpn.public_ip) #aws_instance.open-vpn.public_ip
}

output "host_id"{
  value = aws_instance.open-vpn.id
}

output "config_file" {
  value = "OpenVPN and URL information in the file /usr/local/openvpn_as/init.log"
}
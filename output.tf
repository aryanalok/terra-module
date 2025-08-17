# output "ec2_public_ip" {
#     value = {
#        for key, instance in aws_instance.terr-docker-ec2 : key => instance.public_ip
#     }
  
# }


# output "ec2_public_dns" {
#     value = {
#        for key, instance in aws_instance.terr-docker-ec2 : key => instance.public_dns
#     }
  
# }
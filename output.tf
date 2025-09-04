
#output for count

# output "region" {
#   value = aws_region.current.name
  
# }
# output "aws-ip" {
#     value = aws_instance.MyFirstEC2Instance[*].public_ip
  
# }
# output "aws-dns" {
#     value = aws_instance.MyFirstEC2Instance[*].public_dns
  
# }
# output "instance-id" {
#     value = aws_instance.id
  
# }
# output "vpc-id" {
#     value = aws_default_vpc.default[*].id
  
# }


#output for for_each
output aws_instance_public_ip {
  value = [
    for instance in aws_instance.MyFirstEC2Instance : instance.public_ip
    ]
}

output aws_instance_public_dns {
  value = [
    for instance in aws_instance.MyFirstEC2Instance : instance.public_dns
    ]
}

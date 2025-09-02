# output "region" {
#   value = aws_region.current.name
  
# }
output "aws-ip" {
    value = aws_instance.MyFirstEC2Instance.public_ip
  
}
output "aws-dns" {
    value = aws_instance.MyFirstEC2Instance.public_dns
  
}
output "instance-id" {
    value = aws_instance.MyFirstEC2Instance.id
  
}
output "vpc-id" {
    value = aws_default_vpc.default.id
  
}
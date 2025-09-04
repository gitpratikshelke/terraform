resource "aws_key_pair" "my-key" {
  key_name   = "tera-key-ec2"
  public_key = file("tera-key-ec2.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_default_vpc.default.id


  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "my-security-group" {
  name        = "automate-sg"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id = aws_default_vpc.default.id


 
    ingress {
        description      = "SSH from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description      = "http from VPC"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
     
      }

}


resource "aws_instance" "MyFirstEC2Instance" {
  ami = var.ec2-ami-id 
  # count = 2------------------meta argumnent for multiple instance creation

  for_each = tomap({
    instance1 = "t2.micro"
    instance2 = "t2.micro"
  })

  depends_on = [ aws_security_group.my-security-group ]
  # instance_type = var.ec2_instance
  instance_type = each.value
  key_name      = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.my-security-group.name]
  # user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ec2-root_block_device
    volume_type = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = each.key
    Environment = var.env
  }

}

# resource "aws_instance" "new-instance" {
#   ami           = "unknown"
#   instance_type = "unknown"
#   key_name      = "unknown"
  
  
# }

    


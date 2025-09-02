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
  instance_type = var.ec2_instance
  key_name      = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.my-security-group.name]
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "MyFirstEC2Instance"
  }

}


    


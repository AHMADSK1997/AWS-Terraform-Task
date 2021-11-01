resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    }
 ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
 egress  {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "All networks allowed"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "instance" {
    for_each = toset(["one", "two"])
    ami = var.instance_ami
    instance_type          = var.instance_type
    key_name               = var.instance_key
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    user_data = <<-EOT
        #!/bin/bash
        sudo apt update && sudo apt install -y nginx
    EOT
    tags = {
        Name = var.instance_name_tag
    }
}
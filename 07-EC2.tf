resource "aws_instance" "web_server" {
  ami                         = "ami-083b3f53cbda7e5a4" # us-east-2 Ohio
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.web_server.id, aws_security_group.ping.id]
  subnet_id                   = aws_subnet.public_a.id
  associate_public_ip_address = true
  user_data                   = file("userdataTom.sh")
  #key_name = # use existing keypair - use for ssh

  tags = {
    Name = "web_server"
  }
}
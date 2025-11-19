resource "aws_security_group" "web_server-lb" {
  name        = "web_server-lb"
  description = "allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  tags = {
    Name = "web_server-lb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-http-lb" {
  description       = "tcp"
  security_group_id = aws_security_group.web_server-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "sg-lb-egress-allow-all-ipv4" {
  security_group_id = aws_security_group.web_server-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

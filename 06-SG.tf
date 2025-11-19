resource "aws_security_group" "web_server" {
  name        = "web_server"
  description = "allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  tags = {
    Name = "web_server"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-ssh" {
  description       = "ssh"
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-tcp" {
  description       = "tcp"
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "TCP"
  }
}

resource "aws_vpc_security_group_egress_rule" "sg-egress-allow-all-ipv4" {
  security_group_id = aws_security_group.web_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



############################ SG for ping 
resource "aws_security_group" "ping" {
  name        = "ping"
  description = "Allow icmp for ping"
  vpc_id      = aws_vpc.demo-vpc.id

  tags = {
    Name = "icmp-for-ping"
  }
}

resource "aws_vpc_security_group_ingress_rule" "icmp" {
  security_group_id = aws_security_group.ping.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = -1
  ip_protocol = "icmp"
  to_port     = -1
}

resource "aws_vpc_security_group_egress_rule" "egress_for_ping" {
  security_group_id = aws_security_group.ping.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
# create VPC Network access control list
resource "aws_network_acl" "NeboTask_Security_ACL" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.public-eu-central-1a.id]

  # allow ingress port 22 ssh
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 22
    to_port    = 22
  }

  # allow ingress port 80
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 80
    to_port    = 80
  }
 ingress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }



  # allow egress port 22
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 22
    to_port    = 22
  }

  # allow egress port 80
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 80
    to_port    = 80
  }
  egress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 443
    to_port    = 443
  }

  # Allows outbound SSH traffic
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "92.52.178.146/32"
    from_port  = 1024
    to_port    = 65535
  }


  tags = {
    Name = "NeboTask-ACL"
  }
 depends_on = [time_sleep.wait_30_seconds]

}
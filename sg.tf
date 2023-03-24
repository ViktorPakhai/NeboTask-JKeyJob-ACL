resource "aws_security_group" "SG-WebServer" {
  name        = "SG-Bastion"
  vpc_id      = aws_vpc.main.id
  description = "SG for access to webserver"
  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["92.52.178.0/24"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name  = "SG-public"
    Owner = "V.Pakhai"

  }

}
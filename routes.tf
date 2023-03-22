resource "aws_route_table" "public" { # Creating RT for Public Subnet
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via IGW Gateway
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}


resource "aws_route_table_association" "public-eu-central-1a" {
  subnet_id      = aws_subnet.public-eu-central-1a.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public-eu-central-1b" {
  subnet_id      = aws_subnet.public-eu-central-1b.id
  route_table_id = aws_route_table.public.id
}


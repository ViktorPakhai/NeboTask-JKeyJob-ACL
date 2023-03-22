resource "aws_instance" "Bastion" {
  ami           = "ami-0499632f10efc5a62" # Amazon Linux
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-eu-central-1a.id


  vpc_security_group_ids = [aws_security_group.SG-Bastion.id]
  key_name               = "NewINstansAWS-key"
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum -y install httpd
sudo chkconfig httpd on
sudo service httpd start
sudo cd /var/www/html/
sudo echo '<html><h1>hello, world! Nebo task for ACL </h1></html>' > index.html
EOF

  tags = {
    Name = "EC2 with Web-server"
  }



}

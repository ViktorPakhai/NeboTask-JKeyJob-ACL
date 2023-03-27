resource "aws_instance" "webserver" {
  ami                         = "ami-0e067cc8a2b58de59" # Ubuntu 20.04 LTS
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-eu-central-1a.id
  associate_public_ip_address = true


  vpc_security_group_ids = [aws_security_group.SG-WebServer.id]
  key_name               = "ssh-key-private-aws-frankfurt"
  user_data              = <<EOF
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo su
cd /var/www/html/
echo '<html><h1>hello, world! Nebo task for ACL </h1></html>' > index.html
EOF

  tags = {
    Name = "EC2 with Web-server"
  }



}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_instance.webserver]

  create_duration = "30s"
}
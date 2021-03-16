resource "aws_instance" "web-server-instance" {
  ami               = "ami-096cb92bb3580c759"
  instance_type     = "t2.medium"
  availability_zone = "eu-west-2a"
  key_name          = "AWS"

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF

  tags = {
    Name = "web-server"
  }
}
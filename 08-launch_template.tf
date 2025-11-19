resource "aws_launch_template" "app1_lt" {
  name_prefix   = "app1_lt"
  image_id      = "ami-083b3f53cbda7e5a4"
  instance_type = "t3.micro"

  #   key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.web_server.id]

  user_data = base64encode(file("userdataTom.sh"))

  lifecycle {
    create_before_destroy = true
  }
}
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "eu-west-1"
}

resource "aws_instance" "aws-linux-docker" {
  ami = "ami-d8835caf"
  instance_type = "t1.micro"
  key_name = "macbook-is24"
  user_data = "#cloud-config\noutput : { all : '| tee -a /var/log/cloud-init-output.log' }\nruncmd:\n - [ sh, -c, '/usr/bin/docker login -e ${var.docker_email} -p ${var.docker_passwd} -u ${var.docker_user}' ]\n - [ sh, -c, '/usr/bin/docker run --name buildagent -d murdochjohn/images:latest /bin/bash' ]"
}

#resource "aws_instance" "plain-amazon-linux" {
#    ami = "ami-672ce210"
#    instance_type = "t1.micro"
#    key_name = "macbook-is24"
#}

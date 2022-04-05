resource "aws_instance" "jenkinsMaster_ec2" {
  # AMI
  ami = "ami-0851b76e8b1bce90b"

  #instance type
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.jenkinsMaster_subnet_pub.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.jenkinsMaster_sg.id}"]

  # the aws pem
  key_name               = var.aws_key_pair_name


  # jenkins installation
  user_data = file("install_jenkins.sh")

  tags = {
    Name       = "jenkinsMaster_ec2"
    Department = "cloudDevops"
  }
}


provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "04a1f3afd208d7c93ecce08f8371f2afbdc474c4"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-28 15:44:01"
    git_last_modified_by = "30434343+scottymcandrew@users.noreply.github.com"
    git_modifiers        = "30434343+scottymcandrew"
    git_org              = "scottymcandrew"
    git_repo             = "terragoat"
    yor_trace            = "d0a4431f-c58e-4210-a379-99ba08a9134a"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "04a1f3afd208d7c93ecce08f8371f2afbdc474c4"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-28 15:44:01"
    git_last_modified_by = "30434343+scottymcandrew@users.noreply.github.com"
    git_modifiers        = "30434343+scottymcandrew"
    git_org              = "scottymcandrew"
    git_repo             = "terragoat"
    yor_trace            = "7035f2e2-a9dc-4c71-9222-b186e643da6b"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "Amazon_linux_2" {
  region                      = "us-east-1"
  ami_name                    = "Amazon_linux_2-packer-ami-{{timestamp}}"
  instance_type               = "t2.small"
  source_ami                  = "ami-00c6177f250e07ec1"
  ssh_username                = "ec2-user"
  associate_public_ip_address = true
  ami_regions = [
    "us-east-1"
  ]
}

build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.Amazon_linux_2"
  ]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }
  
  provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }
  
    provisioner "shell" {
    inline = [ "pwd"]
  }
  
  provisioner "shell" {
    inline = [ "cat /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["/bin/bash -x /tmp/provisioner.sh"]
  }
}

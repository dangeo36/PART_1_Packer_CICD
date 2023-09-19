#!/usr/bin/env bash

# updating package
sudo yum -y update

# installing git
sudo yum install git -y

# installing SSM
sudo yum install https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -y

# installing cloudwatch agent
sudo yum install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm -y
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status

# installing AWS inspector
curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install

#insalling docker 
sudo yum install docker -y
sudo systemctl start docker
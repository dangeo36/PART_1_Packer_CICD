# Packer_CICD

The goal of this project is to build a secure 3-tier application and deploy to AWS with resusable code (Terraform and Packer). First, we create a custom, golden ami using Packer. The image will be provisioned with all necessary dependencies. This image will be used later once we containerize our application. We'll take a Java Springboot application called PetClinic and containerize it with a Dockerfile. The image will be pushed to Dockerhub and referenced in the final stage. Finally, we use Terrform to provision all our infrastructure; custom VPC, instances, load balancers, SSL certificates, RDS, etc and run our image in it. The application should be secure in a 3-tier architecture (more details in part 3). 

## Part 1 

In the first part of the project, the goal is to create our own custom ami using Packer. In our 'aws-amazon-linux-2-ami.pkr.hcl' file, we specify our base ami and provisioner information. In the 'provisioner.sh' file, we install AWS SSM (so we don't need to SSH), CloudWatch Agent, AWS Inspector, and Docker. This file is targeted by our .pkr.hcl file. Finally, we write a Jenkinsfile (with access to AWS credentials) to create a pipeline that builds our image. 

## Tools / Dependencies
For this project, I have an Amazon EC2 instance (Ubuntu 20.04, t2.medium) that has Java 17, Jenkins, Terraform, awcli (configured with proper credentials), and Packer. 

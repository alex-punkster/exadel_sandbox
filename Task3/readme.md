## Exadel sandbox Task 3

Actions done:
- installed Terraform
- created Terraform file for automatic deploying two instances with Ubuntu OS and Amazon Linux OS
- confugured security groups for both instances according to the task
- modified user data script for installing docker

**Ubuntu server URL:** http://3.68.90.231

## Extra task

Actions done:
- modified terraform file with AMI ID not hardcoded
- modified terraform file to get subnet CIDR block and attach it to Amazon Linux server security group
- downloaded RPM package of nginx '''wget http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.20.1-1.el7.ngx.x86_64.rpm '''
- copied this package via ssh on Amazon linux instance with sudo scp -i MyKeyPair.pem nginx-1.20.1-1.el7.ngx.x86_64.rpm  ec2-user@172.31.4.19:/home/ec2-user
- run script via ssh to install nginx on Amazon linux instance sudo ssh -i MyKeyPair.pem ec2-user@172.31.11.27 'bash -s' < install_nginx.sh


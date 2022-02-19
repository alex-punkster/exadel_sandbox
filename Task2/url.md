## Exadel sandbox Task 2

Actions done:
- created two EC2 instances on Ubuntu 20.04
- installed Apache web server and PHP 7 on first instance
- created welcome page with system information of first instance
- configured SSH connectivity between instances using SSH keys

**Server URL:** http://3.124.189.37

## Extra task

Actions done:
- Created two VPC with addresses 10.0.0.0/16 and 10.1.0.0/16
- Created two subnets addresses 10.0.1.0/24 and 10.1.1.0/24. Then deployed two EC2 on Ubuntu 20.04 in different subnets
- Created peering connections between VPC-A and VPC-B
- Created route tables and ACLs for each VPC
- Tested ping and SSH connection via public and private IP
- Wrote a bash-script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
- Run this script without manual SSH connection

**Server URL with page created by the script:** http://18.193.79.107

##Extra task (optional)

Actions done:
- Created S3 bucket
- Uploaded a screenshot of my web page
- added this to my web page using its URL

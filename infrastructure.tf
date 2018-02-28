# Ec2 Instance : MongoDB 1
aws_region                     = "us-east-1"
availablity_zones 			   = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_id                         = "vpc-123456789"
private_subnet_ids             = ["subnet-123", "subnet-456","subnet-789"]
ami_id                         = "ami-0987654" # CentOS AMI ID

#MangoDB Security_groups 
resource "aws_security_group" "mongodb" {
	name        = "mongodb-${var.ENVIRONMENT}"
	description = "mongodb security group-${var.ENVIRONMENT}"
	
	tags{
		Name = "mongodb-${var.ENVIRONMENT}"
	}
	}
	
resource "aws_security_group_rule" "mongodb_allow_all" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

resource "aws_security_group_rule" "mongodb_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.mongodb.id}"
}

## MongoDB nodes variables
#MangoDB_node_ebs_volume_count          = "1" # Specify how many volumes to create
#MangoDB_node_ebs_volume_size           = "1024" # Specify how big the volumes should be... size is in GB
MangoDB_node_count                     = "3" # How many MangoDB nodes to create
MangoDB_node_instance_type             = "t2.medium" # Instance size for MangoDB
MangoDB_node_root_disk_size            = "40" # In GB
MangoDB_node_backup_disk_size          = "40" # In GB

# Route 53
route53_root_domain_name      = "test.com" # 





	
	
	
	

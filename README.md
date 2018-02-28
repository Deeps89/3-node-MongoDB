# 3-node-MongoDB
# README

# created terraform code for infrastructure.

# "infrastructure.tf" file which has all configurations and settings for provisiong mongodb cluster on AWS.

# As it is 3 node mongodb cluster we need to start primary server first.

# Then need to start the slave nodes from "infrastructure.tf" file.

terraform plan # shows the complete plan for the AWS  infra.
terraform apply # applies the configuration on AWS environment.
terraform show # displays the applied  infra.

# Use Ansible playbook first_playbook.yml for configuring servers and start the service.

Run playbook using command - ansible-playbook playbooks/first_playbook

# Then created dockerfile and build the docker image to create docker container.

#Access the docker file form "Sampledockerfile.txt".

docker build sampledockerfile/mongodb
docker run -d -p 27017:27017 --name mongodb sampledockerfile/mongodb
docker ps -a # shows docker container of mongodb 3.4 on ubuntu.

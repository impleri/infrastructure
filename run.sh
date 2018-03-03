#!/bin/sh

if [ -z "./terraform.tfvars" ]; then
    cp ./terraform.tfvars.example ./terraform.tfvars
    echo "Please update the Terraform configuration in terraform.tfvars and run this again"
    exit
fi

terraform init
terraform apply

ansible-playbook --inventory-file=`which terraform-inventory` playbooks/bootstrap.yml
ansible-playbook --inventory-file=`which terraform-inventory` playbooks/swarm.yml

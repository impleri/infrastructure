# Impleri Infrastructure

The infrastructure is a simple one based on Terraform and Ansible setting up Docker
Swarm rather than more automated such as what Kubernetes could provide. Underyling
nodes are managed via terraform. Everything is hosted in Digital Ocean, but the 
following could be adapted for most hosting providers.


## Requirements

1. Terraform
2. Ansible
3. [Terraform-inventory](https://github.com/adammck/terraform-inventory)


## Swarm Setup

1. Create Terraform `terraform.tfvars` with the right data.
2. Use Terraform to generate droplets/nodes and a load balancer: `terraform init && terraform apply`
3. Use Ansible to provision the nodes using inventory generated from Terraform-inventory: ```ansible-playbook --inventory-file=`which terraform-inventory` playbooks/swarm.yml```
4. Register the IP addresses from terraform output.

Steps 2-3 can be automated in `run.sh`

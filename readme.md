# Impleri Infrastructure

The infrastructure is a simple one based on Docker Swarm rather than more automated
such as what Kubernetes could provide. Underyling nodes are managed via terraform. Everything is hosted in Digital Ocean, but the following could be
adapted for most hosting providers.


## Swarm setup

1. Create 1 master droplet and 2 or more worker droplets.
2. Create 1 static IP address and attach it to the master.
3. SSH to the master node. (`ssh core@<ip-address>`)
4. Initialize the swarm (`docker swarm init --advertise-addr <static-ip>`)
5. Drain the node (`docker node update --availability drain <NODE>`)
6. Get the join token (`docker swarm join-token manager`)
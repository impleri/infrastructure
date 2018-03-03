# Swarm Node

Base module to create nodes on DigitalOcean.

## Ignition Script

The coreOS Ignition script sets up the iptables firewall. Changes to
`iptables-save.txt` must be replicated in `ignition.json` as a data URI
representation.
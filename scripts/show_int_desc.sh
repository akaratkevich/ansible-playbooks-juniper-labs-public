#!/bin/bash

# Path to the Ansible inventory file
inventory_file="/home/anton/git_hub/ansible-playbooks-juniper-labs-public/inventory/inventory.yml"

# Use ansible-inventory to extract hostnames from the 'routers' group
nodes=($(ansible-inventory -i "$inventory_file" --list | jq -r '.routers.hosts[]'))

# Define the command to execute on each node
command_to_execute="show interfaces descriptions"

# Iterate over the nodes and execute the command
for node in "${nodes[@]}"; do
    echo "Connecting to $node..."
    ssh "$node" "$command_to_execute"
    echo "------------------------------------------"
done


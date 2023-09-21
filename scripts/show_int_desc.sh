#!/bin/bash

# Define a list of nodes
nodes=(
    "anton@r1"
    "anton@r2"
    "anton@r3"
)

# Define the command to execute on each node
command_to_execute="show interfaces descriptions"

# Iterate over the nodes and execute the command
for node in "${nodes[@]}"; do
    echo "Connecting to $node..."
    ssh "$node" "$command_to_execute"
    echo "------------------------------------------"
done


#!/bin/bash

# Define machines with credentials
declare -A machines
machines=(
    ["a.b.c.d"]="xxxxxxx"
)

# Source and destination
src="/home/ai/Desktop/airtravel_dc-production/"
dest="/cygdrive/c/airtravel_dc-production/"

# Loop through machines
for machine in "${!machines[@]}"; do
    password="${machines[$machine]}"
    echo "Syncing with $machine..."
    
    sshpass -p "$password" rsync -avz "$src" "at1@$machine:$dest" --rsync-path="/cygwin64/bin/rsync"
done

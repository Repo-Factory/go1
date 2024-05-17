#!/bin/bash

# This script can be used to easily place the codebase onto the dog (flash it).
# Basically all it does is use sftp to copy the dog_py directory from the local computer to the dog's IP address
# Note that both these values are hardcoded so they will have to be correct for the script to work
# This is only necessary if you change the actual API that the dog will use (src/go/go_api/go.py).

SFTP_ADDRESS="192.168.12.1"
DIRECTORY_TO_UPLOAD="dog_py"

address_available()
{
    ping -c 1 $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "IP is not reachable."
        return 1 #false
    else
        echo "IP is reachable."
        return 0 #true
    fi
}

if ! address_available $SFTP_ADDRESS; then
    echo "Tried to reach dog but it is unavailable, is the robot on?"
    exit 1
fi

sftp -r $SFTP_ADDRESS << EOF
put -r $DIRECTORY_TO_UPLOAD
bye
EOF
echo "Flashed Go1."

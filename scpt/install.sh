#!/bin/bash

# This is a very stupid and dangerous script but it makes my life really easy
# This script's functionality depends on the directory you run it from
# It will find all files under the current directory that end in the suffixes below and place them into the INSTALL_DIR. It also makes them executable
# This is so I can take interpreted code and auxilary files and place them in a single directory so they're easily callable from anywhere

INSTALL_DIR="$HOME/ROBOT_LIB"

mkdir -p "$INSTALL_DIR"
# Define the source directory and the destination directory
destination_dir=$INSTALL_DIR
# Use the find command to locate all Python files in the source directory and its subdirectories
find . -type f -name "*.py" -exec cp {} "$destination_dir" \;
find . -type f -name "*.sh" -exec cp {} "$destination_dir" \;
find . -type f -name "*.json" -exec cp {} "$destination_dir" \;
find . -type f -name "*.pt" -exec cp {} "$destination_dir" \;

sudo chmod +x $INSTALL_DIR/*
echo "Copied all python/bash/json files to $destination_dir and gave permission"
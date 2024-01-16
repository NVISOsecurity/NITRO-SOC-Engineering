#!/bin/bash

# List of usernames to add as sudoers
usernames=("username1" "username2")

# Loop through each username
for username in "${usernames[@]}"
do
    # Add the user to the sudo group
    usermod -aG sudo "$username"

    # Optional: Print a message indicating the user has been added as a sudoer
    echo "Added $username as a sudoer."
done
#!/bin/bash

# Associative array of usernames and hashed passwords
declare -A user_passwords=(
    ["username"]='encrypted_password'
    ["username2"]='encrypted_password2'
)

# Loop through each username and hashed password pair
for username in "${!user_passwords[@]}"
do
    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping..."
    else
        # Create the user with a home directory
        useradd -m -s /bin/bash "$username"

        # Set the hashed password for the user
        hashed_password="${user_passwords[$username]}"
        echo "$username:$hashed_password" | chpasswd -e

        # Optional: Print a message indicating the user has been created
        echo "User $username has been created with the hashed password."
    fi
done
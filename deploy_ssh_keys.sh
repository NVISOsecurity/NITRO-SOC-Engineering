#!/bin/bash

# List of usernames and corresponding public keys (replace with your desired usernames and keys)
declare -A user_keys=(
["username1"]="public_key"
["username2"]="public_key2"
)

# Loop through each username and public key pair
for username in "${!user_keys[@]}"
do
    key="${user_keys[$username]}"

    home_dir="/home/$username"
    ssh_dir="$home_dir/.ssh"

    # Create the .ssh directory if it doesn't exist
    if [ ! -d "$ssh_dir" ]; then
        mkdir -p "$ssh_dir"
    fi

    # Create the authorized_keys file if it doesn't exist
    authorized_keys_file="$ssh_dir/authorized_keys"
    if [ ! -f "$authorized_keys_file" ]; then
        touch "$authorized_keys_file"
        chown $username:$username "$authorized_keys_file"
	echo "Setting authorized_key permissions for $username"
    fi

    # Add the public key to the authorized_keys file
    echo "${user_keys[$username]}" >> "$authorized_keys_file"

    # Set permissions of authorized_keys file
    if [ -f "$authorized_keys_file" ]; then    
	echo "Changing ownership and permissions to the authorized_key files of user: $username"	
	chmod 744 "$authorized_keys_file"
	chown $username:$username "$authorized_keys_file"
    fi 

    # Set permissions to 644 for dir
    echo "Changing permissions to .ssh directory"
    chown $username:$username "$ssh_dir"
    chmod 744 "$ssh_dir"
done

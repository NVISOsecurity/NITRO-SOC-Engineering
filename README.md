# Log Configuration Server Automation Scripts

This is a mini-project to automate the following repetitive tasks:

1. Named user accounts for the teams
2. Assign a pre-defined password for every user
3. Create the _.ssh_ directory
4. Create the _authorized_keys_ file for every user's .ssh directory
5. Change permissions of the _.ssh_ directory to 744
6. Change permissions of the _authorized_keys_ file directory to 744
7. Add the newly created users as sudoers

## Installation

You can copy the files to the destination server via ssh.

```bash
scp -i <priv_key_file> <filename> <username>@<ip_address>:<destination directory>
```
If you need to specify the port, you can use the -P <port_number> parameter.

```bash
scp -i <priv_key_file> -P <port_number> <filename> <username>@<ip_address>:<destination directory>
```

## Usage

Once you have copied the files over, make sure to make them executable:

```bash
chmod +x ./<filename>
```
Once you have the files on the server and made them executable, you can run the script with the following order :
1. Create users
```bash
./user_creation.sh
```
2. Create directory, file and deploy SSH keys
```bash
./deploy_ssh_keys.sh
```
3. Add created users to sudoers
```bash
./add_to_sudoers.sh
```

## Password hash creation

Download mkpasswd
```bash
apt install makepasswd
```
Use mkpasswd to create password hash
```bash
mkpasswd -m sha-512 'password'
```
**Important Notice:** _Always remember to use a strong hashing algorithm!_


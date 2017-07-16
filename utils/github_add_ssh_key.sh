#!/usr/bin/env bash

#
# Create and Upload SSH key (github_add_ssh_key.sh)
#

# TODO Add configure for 2fa

# SSH Keygen
inform "Generating an SSH key to establish a secure connection " true
inform "  your computer and GitHub. "

ssh-keygen -t rsa -b 4096 -C $github_email
ssh-add ~/.ssh/github.id_rsa.ssh

public_key=$(cat ~/.ssh/github.id_rsa.ssh.pub)

show "SSH key created..."

# Upload to GitHub
inform "Uploading SSH key to GitHub..." true

curl https://api.github.com/user/keys \
  -H "User-Agent: BootstrapScript" \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$github_name:$github_password" \
  -d '{"title":"BootstrapScript", "key":"'"$public_key"'"}'

echo ""
show "Key uploaded!" true
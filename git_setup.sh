#!/usr/bin/env bash

# Debuging options:
# -x: Shows each command before it's executed (enables debugging).
# -v: Prints shell input lines as they're read, showing verbose output.
# -e: Exits immediately if a command exits with a non-zero status (error).
# -u: Treats unset variables as an error when substituting.
# -o pipefail: Makes a pipeline's return status the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -euo pipefail

# Ensure Git is installed
if ! command -v git &> /dev/null
then
	sudo apt install -y git
fi
# Verify Git installation
git --version

# Configure Git wit your user details
git config --global user.name "your_usernamme"
git config --global user.email "your_noreply_git_mail@users.noreply.github.com"

# Generate SSH keys and display the public key
# -f the file to save the new ssh key. It will be created or will ask for overwrite if exists.
# -N specifiy ssh key pass or leave empty for none
ssh-keygen -t ed25519 -C "your_git_account@mail.com" -f ~/.ssh/github_ed25519 -N ""
	cat ~/.ssh/github_ed25519.pub

echo "Done!"

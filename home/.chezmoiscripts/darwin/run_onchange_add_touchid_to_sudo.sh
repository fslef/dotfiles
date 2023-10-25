#!/bin/bash

# Ask for the administrator password upfront
sudo -v

echo "Adding Touch ID support to /etc/pam.d/sudo for use in Terminal..."

grep -qxF 'auth       sufficient     pam_tid.so' /etc/pam.d/sudo || echo -e "$(head -n 1 /etc/pam.d/sudo)\nauth       sufficient     pam_tid.so\n$(tail -n +2 /etc/pam.d/sudo)" | sudo tee /etc/pam.d/sudo >/dev/null

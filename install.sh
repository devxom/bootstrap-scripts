#!/usr/bin/env bash

# Authors: Ilya Reshetnikov (2017)

# Resources:
#
# https://github.com/thoughtbot/laptop
# https://github.com/pdbrown/dotfiles/
# https://github.com/paulirish/dotfiles

if [[ `whoami` == 'root' ]]; then
  echo "This script not must be run by root!" 1>&2
  echo "Remove 'sudo' and try again." 1>&2
  exit 1
fi

clear

#
source utils/define_env_vars.sh

# import echo function
source utils/echo.sh

inform "Script version at: ${SCRIPT_VERSION}"
inform "Script execution begun: $(date)"
inform ""

#
# Set text formatting (utils/define_colors.sh)
#
source utils/define_colors.sh

#
# utils/password_capture.sh
#
source utils/capture_password.sh

#
# Check for software updates
#

sudo dnf -y update --refresh
sudo dnf -y upgrade
sudo dnf -y distro-sync

packagelist=(
  libgnome-keyring-dev
  git
  git-core
  xclip
  curl
  httpie
  imagemagick
  emacs
  zsh
  vim
)

sudo dnf -y install ${packagelist[@]}

assert_package_installed ${packagelist[@]}

#
# Capture GitHub credentials (github_capture_credentials.sh)
#
source utils/github_capture_credentials.sh

#
# Add user's Git info to ~/.gitconfig (git_configure.sh)
#
source utils/git_configure.sh

#
# Install NVM (nvm_install.sh)
#
source utils/nvm_install.sh

#
# Install Node (nvm_install_version.sh)
#
source utils/node_install.sh

inform "We're done!" true

fail "Please close your terminal and open a new one!" true
echo ""

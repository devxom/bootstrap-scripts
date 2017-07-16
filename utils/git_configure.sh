#!/usr/bin/env bash

#
# Add user's Git info to ~/.gitconfig (git_configure.sh)
#

inform "Setting Git configurations..." true

wget -O- -q https://raw.githubusercontent.com/devxom/dotfiles/master/config/git/gitconfig > ~/.gitconfig
wget -O- -q https://raw.githubusercontent.com/devxom/dotfiles/master/config/git/gitignore_global > ~/.gitignore_global
wget -O- -q https://raw.githubusercontent.com/devxom/dotfiles/master/config/git/git_commit_template > ~/.git_commit_template
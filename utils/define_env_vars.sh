#!/usr/bin/env bash

#
# Set up basic env vars (utils/script_env_vars.sh)
#

# Standard Bash Variables
#
# `OSTYPE`   A string describing the operating system Bash is running on.
# `MACHTYPE` system type in cpu-company-system
# `SECONDS`  number of seconds since the shell was started.

SCRIPT_VERSION="0.0.1"

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_ROOT="$HOME/.bin"

NODE_VERSION="stable"

OSTYPE_MAC="MACOSX"
OSTYPE_LINUX_UNKNOWN="LINUX"
OSTYPE_UNKNOWN="UNKNOWN"

platform=$OSTYPE_UNKNOWN
if [[ "$OSTYPE" == "linux-gnu" ]]; then
   platform=$OSTYPE_LINUX_UNKNOWN
   BASH_FILE=".bashrc"
fi
if [[ "$OSTYPE" == "darwin"* ]]; then
   platform=$OSTYPE_MAC
   BASH_FILE=".bash_profile"
   MINIMUM_MAC_OS="10.7.0"
fi



#SCRIPT_REPO=""
#SCRIPT_REPO_BRANCH="master"
#
## the downloaded repo
#SCRIPT_DIR="$SCRIPT_ROOT/installfest"
#SCRIPT_SETTINGS="$SCRIPT_DIR/settings"
#
#SCRIPT_DOTFILES=$SCRIPT_SETTINGS/dotfiles/*
#SCRIPT_FONTS=$SCRIPT_SETTINGS/fonts/*
#SCRIPT_SUBL_SETTINGS=$SCRIPT_SETTINGS/sublime_settings/*
#SCRIPT_SUBL_PACKAGES=$SCRIPT_SETTINGS/sublime_packages/*
#SCRIPT_THEMES=$SCRIPT_SETTINGS/terminal/*

#!/usr/bin/env zsh

# Main entries

# Path
export PATH=$PATH:"/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"

export IDLEBOX=$HOME/.idlebox

# Load config
IFS_temp=$IFS
IFS=$'\n'
# Read config file and ignore comment lines and blank lines.
for line in $(grep -v "^#" < $IDLEBOX'/config' | grep -v "^\s*$"); do
  eval 'export IDLEBOX_'$line
done
IFS=$IFS_temp

# Source all scripts in zshrcs/
# For same name scripts, private scripts have higher priority.
PRIVATE_SCRIPT_NAMES=($(cd $IDLEBOX/zshrcs/private/ && find . -maxdepth 1 -type f))
PUBLIC_SCRIPT_NAMES=($(cd $IDLEBOX/zshrcs/public/ && find . -maxdepth 1 -type f))
# Load public scripts which doesn't have same name with private scripts:
for public_script_name in $PUBLIC_SCRIPT_NAMES; do
  do_load_private_script=false
  for private_script_name in $PRIVATE_SCRIPT_NAMES; do
    if [[ $public_script_name == $private_script_name ]]; then
      do_load_private_scrip=true
      break
    fi
  done
  if [[ $do_load_private_scrip != true ]]; then
    source $IDLEBOX/zshrcs/public/$public_script_name
  fi
done
# Load all private scripts:
for private_script_name in $PRIVATE_SCRIPT_NAMES; do
  source $IDLEBOX/zshrcs/private/$private_script_name
done
# Clear variables:
unset do_load_private_script
unset PRIVATE_SCRIPT_NAMES
unset PUBLIC_SCRIPT_NAMES

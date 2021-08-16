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

source $IDLEBOX_ZSHRCS_PATH/public/shell-reload
shell-reload

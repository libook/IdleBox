#!/usr/bin/env zsh

# Main entries

# Path
export PATH=$PATH:"/usr/local/bin:/usr/bin/core_perl:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

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
PRIVATE_SCRIPT_NAMES=($(cd $IDLEBOX/zshrcs/private/ && find . -maxdepth 1 -type f | sort))
PUBLIC_SCRIPT_NAMES=($(cd $IDLEBOX/zshrcs/public/ && find . -maxdepth 1 -type f | sort))
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

# Split $PATH into array
path_array=("${(@s/:/)PATH}")
path_array_unique=()
path_unique=""
for ((pa_i = $#path_array; pa_i >= 1; pa_i--));do
  have_found_in_path_array_unique="false"
  for ((pau_i = 1; pau_i <= $#path_array_unique; pau_i++));do
    if [[ $path_array[pa_i] == $path_array_unique[pau_i] ]];then
      have_found_in_path_array_unique="true"
      break
    fi
  done
  if [[ $have_found_in_path_array_unique == "false" ]];then
    # Append to path_array_unique
    path_array_unique+=$path_array[pa_i]
    if [[ -z $path_unique ]];then
      path_unique=$path_array[pa_i]
    else
      path_unique=$path_array[pa_i]:$path_unique
    fi
  fi
done

export PATH=$path_unique
unset path_unique
unset path_array
unset path_array_unique
unset have_found_in_path_array_unique

# Main entries

# Path
export PATH=$PATH:"/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"

export IDLEBOX=$HOME/.idlebox

# Load config
for line in $(cat < $IDLEBOX'/config'); do
  eval 'export IDLEBOX_'$line
done

# Source all scripts in zshrcs/
for f in $IDLEBOX_ZSHRCS_PATH/*/*; do source $f; done

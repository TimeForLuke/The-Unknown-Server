#!/bin/bash
# Backs up the Minecraft server.
# Use the -q option to only output errors.

repo_dir="$(dirname "${BASH_SOURCE[0]}")/.."
backup_dir=${repo_dir}/backup
today=${date +"%F")

getopts q quiet
if [[ "$quiet" == "q" ]]; then
    verbose=false
else
    verbose=true
fi

$verbose && echo "Backing up the server files..."
tar czf ${backup_dir}/backup-survival-${today}.tar.gz -C $repo_dir server

$verbose && echo "Done!"

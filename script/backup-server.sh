#!/bin/sh
# Backs up the Minecraft and MySQL servers.
# Use the -q option to only output errors.

mysql_user=unknown
mysql_password=secret

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

$verbose && echo "Backing up the SQL database..."
mysqldump -u $mysql-user -p$mysql-password --databases unknown_minecraft | gzip > ${backup_dir}/backup-database-${today}.sql.gz

$verbose && echo "Done!"

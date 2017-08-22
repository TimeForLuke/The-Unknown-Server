#!/bin/sh
# Backs up the Minecraft and MySQL servers.
# Use the -q option to only output errors.

mysql_user=unknown
mysql_password=secret

getopts q quiet
if [[ "$quiet" == "q" ]]; then
    verbose=false
else
    verbose=true
fi

$verbose && echo "Backing up the server files..."
tar czf ../backup/backup-survival-$(date +"%F").tar.gz -C .. server

$verbose && echo "Backing up the SQL database..."
mysqldump -u $mysql-user -p$mysql-password --databases unknown_minecraft | gzip > ../backup/backup-database-$(date +"%F").sql.gz

$verbose && echo "Done!"

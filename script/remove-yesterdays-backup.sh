#!/bin/sh
# Removes yesterday's Minecraft and MySQL server backups

YESTERDAY=$(date -d "1 day ago" +%Y-%m-%d)

rm ../backup/backup-database-${YESTERDAY}.sql.gz
rm ../backup/backup-survival-${YESTERDAY}.tar.gz


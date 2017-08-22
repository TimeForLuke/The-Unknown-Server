#!/bin/sh
# Removes yesterday's Minecraft and MySQL server backups

yesterday=$(date -d "1 day ago" +%Y-%m-%d)
dir="$(dirname "${BASH_SOURCE[0]}")/../backup"

rm ${dir}/backup-database-${yesterday}.sql.gz
rm ${dir}/backup-survival-${yesterday}.tar.gz


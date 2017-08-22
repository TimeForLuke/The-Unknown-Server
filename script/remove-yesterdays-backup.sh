#!/bin/bash
# Removes yesterday's Minecraft server backup

yesterday=$(date -d "1 day ago" +%Y-%m-%d)
dir="$(dirname "${BASH_SOURCE[0]}")/../backup"

rm ${dir}/backup-survival-${yesterday}.tar.gz


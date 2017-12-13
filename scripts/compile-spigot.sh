#!/bin/bash
# Downloads and compiles Spigot. The resulting
# jar file will be in the specified directory.
# Requirements:
# - git
# - jdk 8
# Usage:
# ./script output_directory

OUTPUT_DIR=$1
if [ ! -d $OUTPUT_DIR ]; then
    echo "Output file is not a directory!"
    exit
fi

TMP=$(mktemp -d)
cd $TMP

# Compile BuildTools.jar
git clone https://hub.spigotmc.org/stash/scm/spigot/buildtools.git
cd buildtools
git reset --hard 59469f0fef76246025b63f0dd3287cfa19a06505
mvn package
cp target/BuildTools.jar ..
cd ..

# Compile Spigot
java -jar BuildTools.jar --rev 1.12.2
cp spigot-1.12.2.jar $1

rm -rf $TMP

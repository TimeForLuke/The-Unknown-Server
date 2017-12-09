#!/bin/bash
# Downloads and compiles (where possible) all required plugins. The resulting
# jar files will be in the specified directory.
# Requirements:
# - wget
# - git
# - mvn
# - jdk 8
# Usage: ./script output_directory
#
# Due to dependency issues during the build processes, EssentialsX,
# EssentialsXSpawn, EssentialsXChat, LuckPerms and Vault have been included as
# jar files in this repository.

OUTPUT_DIRECTORY=$1
if [ ! -d "$OUTPUT_DIRECTORY" ]; then
    echo "Output directory is not a directory!"
    exit
fi

TMP=$(mktemp -d)
cd $TMP

echo "Compiling GriefPrevention..."
wget https://github.com/TechFortress/GriefPrevention/archive/16.7.1.tar.gz
mv 16.7.1.tar.gz GriefPrevention-16.7.1.tar.gz
tar -xzf GriefPrevention-16.7.1.tar.gz
cd GriefPrevention-16.7.1
mvn package
cp target/GriefPrevention.jar $OUTPUT_DIRECTORY
cd ..

echo "Compiling NoCheatPlus..."
git clone https://github.com/NoCheatPlus/NoCheatPlus.git
cd NoCheatPlus
git reset --hard 7e43deaa28fb66a7b8273eed8d9dfa8956e97d62
mvn package -P spigot1_11_r1 -P ncp_base
cp target/NoCheatPlus.jar $OUTPUT_DIRECTORY
cd ..

echo "Compiling WorldEdit..."
wget https://github.com/sk89q/WorldEdit/archive/6.1.tar.gz
mv 6.1.tar.gz WorldEdit-6.1.tar.gz
tar -xzf WorldEdit-6.1.tar.gz
cd WorldEdit-6.1
./gradlew setupDevWorkspace
./gradlew build
cp worldedit-bukkit/build/libs/worldedit-bukkit-6.1-dist.jar $OUTPUT_DIRECTORY
cd ..

echo "Compiling WorldGuard..."
# Release 6.2 was outdated.
git clone https://github.com/sk89q/WorldGuard.git
cd WorldGuard
git reset --hard 3a8e3e84b8ac118cf83daa4fe7b492dfd27a96b5
chmod +x gradlew
./gradlew build
cp worldguard-legacy/build/libs/worldguard-legacy-6.2.2-SNAPSHOT-dist.jar $OUTPUT_DIRECTORY
cd ..

rm -rf $TMP

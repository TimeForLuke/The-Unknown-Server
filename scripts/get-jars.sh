#!/bin/bash
# Downloads and compiles (where possible) all required jar files. The resulting
# jar files will be in the bin/ directory.
# Requirements:
# - wget
# - git
# - mvn
# - jdk 8
#
# Due to dependency issues during the build processes, EssentialsX,
# EssentialsXSpawn, EssentialsXChat, LuckPerms and Vault have been included as
# jar files in this repository.
# CoreProtect is proprietary and needs to be downloaded manually into
# bin/ because CloudFlare doesn't like scripts:
# https://www.spigotmc.org/resources/coreprotect.8631/

cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Clear bin/ first to make sure we won't have old versions in there

rm bin/*
git checkout -- bin

# Get the jars from git-lfs

git lfs fetch
git lfs checkout

mkdir build
cd build

# Compile Spigot's BuildTools
git clone https://hub.spigotmc.org/stash/scm/spigot/buildtools.git
cd buildtools
mvn package
mkdir ../Bukkit
cp target/BuildTools.jar ../Bukkit
cd ..

# Use BuildTools to compile Spigot
cd Bukkit
java -jar BuildTools.jar --rev 1.12.1
cp spigot-1.12.1.jar ../../bin
cd ..

# Get the plugins

# Get GriefPrevention
wget https://github.com/TechFortress/GriefPrevention/archive/16.7.1.tar.gz
mv 16.7.1.tar.gz GriefPrevention-16.7.1.tar.gz
tar -xzf GriefPrevention-16.7.1.tar.gz
cd GriefPrevention-16.7.1
mvn package
cp target/GriefPrevention.jar ../../bin
cd ..

# Get NoCheatPlus
git clone https://github.com/NoCheatPlus/NoCheatPlus.git
cd NoCheatPlus
mvn package -P spigot1_11_r1 -P ncp_base
cp target/NoCheatPlus.jar ../../bin
cd ..

# Get WorldEdit
wget https://github.com/sk89q/WorldEdit/archive/6.1.tar.gz
mv 6.1.tar.gz WorldEdit-6.1.tar.gz
tar -xzf WorldEdit-6.1.tar.gz
cd WorldEdit-6.1
./gradlew setupDevWorkspace
./gradlew build
cp worldedit-bukkit/build/libs/worldedit-bukkit-6.1-dist.jar ../../bin
cd ..

# Get WorldGuard
# Release 6.2 was outdated.
git clone https://github.com/sk89q/WorldGuard.git
cd WorldGuard
git reset --hard 3a8e3e84b8ac118cf83daa4fe7b492dfd27a96b5
chmod +x gradlew
./gradlew build
cp worldguard-legacy/build/libs/worldguard-legacy-6.2.2-SNAPSHOT-dist.jar ../../bin
cd ..

# Everything is in bin/ now.

cd ..
rm -rf build/

echo
echo "CoreProtect is proprietary and needs to be downloaded manually into ../server/plugins or in ../bin because CloudFlare doesn't like scripts. Download URL:"
echo "https://www.spigotmc.org/resources/coreprotect.8631/download?version=129564"

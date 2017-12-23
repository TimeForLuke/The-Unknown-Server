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
# Due to dependency issues during the build processes, Vault, WorldEdit and NoCheatPlus
# have been included as jar files in this repository.

OUTPUT_DIRECTORY=$1
if [ ! -d "$OUTPUT_DIRECTORY" ]; then
    echo "Output directory is not a directory!"
    exit
fi

TMP=$(mktemp -d)
cd $TMP

if [ ! -e "${OUTPUT_DIRECTORY}/GriefPrevention"*".jar" ]; then
	echo "Compiling GriefPrevention..."
	git clone https://github.com/TechFortress/GriefPrevention.git
	cd GriefPrevention
	git reset --hard ae0b0520dcc0724ab6eaefcbef27bd9d67dddccd
	mvn clean install
	cp target/GriefPrevention.jar $OUTPUT_DIRECTORY
	cd ..
fi

if [ ! -e "${OUTPUT_DIRECTORY}/Essentials"*".jar" ]; then
	echo "Compiling EssentialsX..."
	git clone https://github.com/drtshock/Essentials.git
	cd Essentials
	git reset --hard dcbc106e62f39fbe82138a5e51c07f748d7ac15b
	# We need several versions of Spigot/CraftBukkit to compile EssentialsX.
	git clone https://hub.spigotmc.org/stash/scm/spigot/buildtools.git
	cd buildtools
	git reset --hard 59469f0fef76246025b63f0dd3287cfa19a06505
	mvn package
	cp target/BuildTools.jar ..
	cd ..
	java -jar BuildTools.jar --rev 1.8
	java -jar BuildTools.jar --rev 1.8.3
	java -jar BuildTools.jar --rev 1.9
	java -jar BuildTools.jar --rev 1.9.4
	mvn clean install
	cp Essentials/target/EssentialsX-2.0.1.jar $OUTPUT_DIRECTORY
	cp EssentialsSpawn/target/EssentialsXSpawn-2.0.1.jar $OUTPUT_DIRECTORY
	cp EssentialsChat/target/EssentialsXChat-2.0.1.jar $OUTPUT_DIRECTORY
	cd ..
fi

if [ ! -e "${OUTPUT_DIRECTORY}/LuckPerms"*".jar" ]; then
	git clone https://github.com/lucko/LuckPerms.git
	cd LuckPerms/
	git reset --hard e5ce64266f1aaf5bc745cfb33e3cd3a1dbe3da32
	mvn clean package
	cp bukkit/target/LuckPerms-Bukkit-4.0.46.jar $OUTPUT_DIRECTORY
	cd ..
fi

if [ ! -e "${OUTPUT_DIRECTORY}/NoCheatPlus"*".jar" ]; then
	echo "Compiling NoCheatPlus..."
	git clone https://github.com/NoCheatPlus/NoCheatPlus.git
	cd NoCheatPlus
	git reset --hard 7e43deaa28fb66a7b8273eed8d9dfa8956e97d62
	mvn package -P spigot1_11_r1 -P ncp_base
	cp target/NoCheatPlus.jar $OUTPUT_DIRECTORY
	cd ..
fi

if [ ! -e "${OUTPUT_DIRECTORY}/Bukkit-Mailman"*".jar" ]; then
	echo "Compiling Bukkit-Mailman..."
	git clone https://github.com/Omniscimus/Bukkit-Mailman.git
	cd Bukkit-Mailman
	git reset --hard 0262c53ae491a0d393ea587801aa1f65985c66bd
	mvn clean install
	cp target/Bukkit-Mailman-0.0.1.jar $OUTPUT_DIRECTORY
	cd ..
fi

# Building Vault failed because it can't resolve some dependencies.
#git clone https://github.com/MilkBowl/Vault.git
#cd Vault/
#git reset --hard fbb9ce69aceb7cf29c829bcf4661ee8674420d9d
#mvn clean install
#cp -r target $OUTPUT_DIRECTORY/vault
#cd ..

# Don't include WorldEdit for now.
#echo "Compiling WorldEdit..."
#wget https://github.com/sk89q/WorldEdit/archive/6.1.tar.gz
#mv 6.1.tar.gz WorldEdit-6.1.tar.gz
#tar -xzf WorldEdit-6.1.tar.gz
#cd WorldEdit-6.1
#./gradlew setupDevWorkspace
#./gradlew build
#cp worldedit-bukkit/build/libs/worldedit-bukkit-6.1-dist.jar $OUTPUT_DIRECTORY
#cd ..

# Don't include WorldGuard for now.
#echo "Compiling WorldGuard..."
## Release 6.2 was outdated.
##git clone https://github.com/sk89q/WorldGuard.git
#cd WorldGuard
#git reset --hard 3a8e3e84b8ac118cf83daa4fe7b492dfd27a96b5
#chmod +x gradlew
#./gradlew build
#cp worldguard-legacy/build/libs/worldguard-legacy-6.2.2-SNAPSHOT-dist.jar $OUTPUT_DIRECTORY
#cd ..

rm -rf $TMP

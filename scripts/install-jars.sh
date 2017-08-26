#!/bin/bash
# Puts the jar files from bin/ into the appropriate directories. Deletes any
# old jars that were still there.

cd "$(dirname "${BASH_SOURCE[0]}")/.."

if (( $(ls | grep bin | wc -l) == 0 )); then
    echo "The bin/ directory doesn't exist."
    exit -1
fi

# Replace the spigot jar

if (( $(ls bin | grep -i spigot.*.jar | wc -l) > 0 )); then
    rm server/spigot*.jar &>/dev/null
    cp bin/spigot*.jar server
fi

# Replace all plugins

function replace_plugin {
    # in grep, the * wildcard is .* instead
    # ${1//\*/.\*} means: replace all * in $1 with .*
    if (( $(ls bin | grep -i ${1//\*/.\*} | wc -l) > 0 )); then
        rm server/plugins/$1 &>/dev/null
        cp bin/$1 server/plugins
    fi
}

replace_plugin CoreProtect*.jar
replace_plugin EssentialsX-*.jar
replace_plugin EssentialsXChat*.jar
replace_plugin EssentialsXSpawn*.jar
replace_plugin GriefPrevention*.jar
replace_plugin LuckPerms*.jar
replace_plugin NoCheatPlus*.jar
replace_plugin Vault*.jar
replace_plugin worldedit*.jar
replace_plugin worldguard*.jar

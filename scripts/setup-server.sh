#!/bin/bash

if [ ! -e /data/spigot-1.12.2.jar ]; then
  echo -e "Compiling Spigot...\n"
  /scripts/compile-spigot.sh "/data"
fi

if [ ! -e /data/plugins/NoCheatPlus.jar ]; then
  echo -e "Compiling plugins...\n"
  /scripts/compile-plugins.sh "/data/plugins"
fi

echo -e "Starting the server...\n"
#/scripts/auto-restart-server.sh

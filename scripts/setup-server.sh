#!/bin/bash

if [ ! -e /data/spigot-1.12.1.jar ]; then
  echo "Compiling Spigot...\n"
  /scripts/compile-spigot.sh "/data"
fi

if [ ! -e /data/plugins/NoCheatPlus.jar ]; then
  echo "Compiling plugins...\n"
  /scripts/compile-plugins "/data/plugins"
fi

echo "Starting the server...\n"
/scripts/auto-restart-server.sh

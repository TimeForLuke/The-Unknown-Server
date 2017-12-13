#!/bin/bash

if [ ! -e "server/spigot"*".jar" ]; then
  echo -e "Compiling Spigot...\n"
  /scripts/compile-spigot.sh "/data"
fi

echo -e "Compiling plugins...\n"
/scripts/compile-plugins.sh "/data/plugins"

echo -e "Starting the server...\n"
/scripts/auto-restart-server.sh

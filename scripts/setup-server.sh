#!/bin/bash

if [ ! -e /data/spigot-1.12.1.jar ]; then
  /scripts/compile-spigot.sh "/data"
fi

if [ ! -e /data/plugins/NoCheatPlus.jar ]; then
  /scripts/compile-plugins "/data/plugins"
fi

/scripts/auto-restart-server.sh

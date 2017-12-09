#!/bin/bash
# Starts the server.

java -server -d64 -Xms1024m -Xmx1024m -XX:+UseBiasedLocking -jar spigot-1.12.1.jar nogui

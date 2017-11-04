#!/bin/bash
# Starts the server and automatically restarts it if the process ends.
# If the server crashes, but the process is still running, the server could
# still restart depending on how that's configured in ../server/spigot.yml.

cd "$(dirname "${BASH_SOURCE[0]}")"
while true; do
    ./start-server.sh

    echo "If you want to completely stop the server process now, press Ctrl+C
          before the time is up!"
    echo "Rebooting in:"
    for i in 5 4 3 2 1; do
        echo "$i..."
        sleep 1
    done
    echo "Rebooting now!"
done

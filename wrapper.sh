#!/bin/bash

# Start signal daemon
# /usr/bin/signal-cli -a $ACCOUNT daemon --http 0.0.0.0:8551 &

# Start python handler
python3 /app/signalbot.py &

wait -n

# Exit with status of process that exited first
exit $?
#!/bin/bash

/usr/bin/signal-cli daemon --tcp 0.0.0.0:8551 &

python signalbot.py &

wait -n

# Exit with status of process that exited first
exit $?
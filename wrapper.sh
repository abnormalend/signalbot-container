#!/bin/bash

which python
which python3
# find / -name python


/usr/bin/signal-cli daemon --tcp 0.0.0.0:8551 &

# python /app/signalbot.py &

wait -n

# Exit with status of process that exited first
exit $?
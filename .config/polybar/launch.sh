#!/usr/bin/env bash

killall -q polybar

# Wait until bars have been terminated.
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars.
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top &
done

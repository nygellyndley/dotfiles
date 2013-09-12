#!/bin/bash

echo "checking monitor setup"
xrandr -q > /tmp/setup_screens
multi="$(grep 'DisplayPort-0 connected' /tmp/setup_screens)"

if [ "$multi" ]; then
  echo "MULTI-MONITOR";
  /home/nygel/Shared/Scripts/triple_head.sh
else
  echo "SINGLE MONITOR";
  /home/nygel/Shared/Scripts/single_head.sh
fi


#!/bin/sh

xrandr --output DisplayPort-0 --mode 1280x1024 --rotate right \
       --output VGA-0 --mode 1280x1024 --rotate right --pos 1024x0 \
       --output LVDS --mode 1600x900  --pos 224x1280

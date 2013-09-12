#!/bin/bash

MAX_TIME=10
COUNTER=0

echo "waiting for network"

# just wait till we have wired or wireless up
# if wired set tm proxy
# done in .xinitrc as it looks like it needs to be here
# to propogate through to WM

until [ $COUNTER -ge $MAX_TIME ]; do
  
  # grab all relevant interface info
  ip addr show enp0s25 > /tmp/network_wired
  ip addr show wlo1 > /tmp/network_wireless
  echo $COUNTER > /tmp/network_counter

  wiredup="$(grep 'state UP' /tmp/network_wired)"
  wirelessup="$(grep 'state UP' /tmp/network_wireless)"

  if [ "$wiredup" ]; then
    echo "setting tm proxy"
    export http_proxy=http://proxy.tm-gnet.com:3128/
    export https_proxy=$http_proxy
    export no_proxy="localhost, 127.0.0.1, 10.0.0.0/8, 192.168.171.0/24, *.ddt.local, *.tm-gnet.com, *.gmnews.co.uk, crmmail.menmedia.co.uk, *.gmgrd, *.gmgrd.co.uk"
    COUNTER=10
  elif [ "$wirelessup" ]; then
    echo "setting no proxy"
    export http_proxy=""
    export https_proxy=""
    export no_proxy=""
    COUNTER=10
  else
    sleep 1;
  fi
done


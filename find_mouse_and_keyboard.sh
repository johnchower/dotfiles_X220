#!/bin/bash
xinput list | grep Logitech | grep -o "id=[0-9]\{2\}" | grep -o "[0-9]\{2\}" | xargs -I id xinput set-button-map id 3 2 1 5 4
xinput list | grep Telink | grep keyboard | grep -o "id=[0-9]\{2\}" | grep -o "[0-9]\{2\}" | xargs -I id xinput setxkbmap -option caps:ctrl_modifier -device id

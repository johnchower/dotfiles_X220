#!/bin/bash
VGASTAT=`xrandr | grep VGA1 | grep -o "[a-z]*connected"`
if [ $VGASTAT = "disconnected" ]; then
	xrandr --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x520 --rotate normal --output VGA1 --mode 1920x1200 --pos 1366x0 --rotate normal
else
	xrandr --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --off --output VGA1 --mode 1920x1200 --pos 0x0 --rotate normal
fi 

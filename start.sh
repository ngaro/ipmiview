#!/bin/bash
Xvfb :1 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
DISPLAY=:1 /opt/IPMIView/IPMIView20 &
cd /usr/share/novnc/utils && ./launch.sh --vnc localhost:5900 &
sleep infinity

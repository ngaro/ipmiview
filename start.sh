#!/bin/bash
# Start the X server
Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
# Make it accessible with VNC with password
VNCPASS=$(pwgen -1 10)
echo "Your VNC password is: $VNCPASS"
x11vnc -storepasswd "$VNCPASS" ~/.vnc/passwd
x11vnc -display :0 -forever -shared -quiet -bg -xkb -usepw
# Start IPMIView in the X server
DISPLAY=:0 /opt/IPMIView/IPMIView20 &
# Make it accessible with http
cd /usr/share/novnc/utils && ./launch.sh --vnc localhost:5900

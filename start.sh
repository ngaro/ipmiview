#!/bin/bash

# Starts a program on DISPLAY :0 and restarts it every time it exits
keep_running_in_X() {
    while true; do
	DISPLAY=:0 "$1" &
	wait $!	#$! is the PID of the last backgrounded process
    done
}

# Start the X server
Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &

# Make it accessible with VNC with password
VNCPASS=$(pwgen -1 10)
echo "Your VNC password is: $VNCPASS"
mkdir -p ~/.vnc && x11vnc -storepasswd "$VNCPASS" ~/.vnc/passwd
x11vnc -display :0 -forever -shared -quiet -bg -xkb -usepw

# Start IPMIView in the X server
keep_running_in_X /opt/IPMIView/IPMIView20 &

# Make it accessible with http
cd /usr/share/novnc/utils && ./launch.sh --vnc localhost:5900

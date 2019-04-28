#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Install noVNC - HTML5 based VNC viewer"

git clone https://github.com/novnc/noVNC.git $NO_VNC_HOME

git clone https://github.com/novnc/websockify.git $NO_VNC_HOME/utils/websockify
chmod +x -v $NO_VNC_HOME/utils/*.sh
## create index.html to forward automatically to `vnc_lite.html`
ln -s $NO_VNC_HOME/vnc_auto.html $NO_VNC_HOME/index.html
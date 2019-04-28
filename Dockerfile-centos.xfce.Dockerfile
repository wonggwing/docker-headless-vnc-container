# This Dockerfile is used to build an headles vnc image based on Centos

FROM centos:7

MAINTAINER William Wong "wonggwing@gmail.com"

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    NO_VNC_HOME=/headless/noVNC \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_PASSWORD=no \
    VNC_VIEW_ONLY=false \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

EXPOSE $VNC_PORT $NO_VNC_PORT
WORKDIR $HOME

### Add all install scripts for further steps
COPY ./src/common/install/ ./src/centos/install/ $INST_SCRIPTS/
COPY ./src/common/xfce/ $HOME/
COPY ./src/common/scripts $STARTUPDIR
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} + && \

### Install some common tools (Split layers for dependencies)
    $INST_SCRIPTS/tools.sh

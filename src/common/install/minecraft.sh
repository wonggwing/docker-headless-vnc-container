#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Download minecraft launcher"
mkdir -p $HOME/minecraft
wget -qO- https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar $HOME/minecraft/Minecraft.jar

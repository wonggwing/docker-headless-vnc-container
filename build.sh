#!/usr/bin/env bash

docker build . -f Dockerfile-centos.xfce.Dockerfile -t docker-headless-vnc-container-centos:latest

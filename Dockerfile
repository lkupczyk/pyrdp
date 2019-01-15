
#
# This file is part of the PyRDP project.
# Copyright (C) 2018 GoSecure Inc.
# Licensed under the GPLv3 or later.
#

#Command to run a container (the options are required for the pyrdp-player.py to work):
#sudo docker run -e DISPLAY --net=host <image id or name> 

FROM ubuntu:18.04
COPY . /pyRDPcontainer
WORKDIR /pyRDPcontainer
ENV QT_X11_NO_MITSHM=1
RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install python3 \
&& apt-get -y install python3-pip \
&& pip3 install --upgrade setuptools \
&& pip3 install -U cryptography \
&& apt-get install python3-pyqt4 -y \
&& python3 setup.py install \
#Setup for py-player
&& apt-get install notify-osd -y \
&& apt-get install dbus-x11 -y
WORKDIR /pyRDPcontainer/bin


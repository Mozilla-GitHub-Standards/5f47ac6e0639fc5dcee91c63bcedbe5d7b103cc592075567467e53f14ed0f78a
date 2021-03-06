#!/bin/bash -ex

apt-get update -y -qq

cat << EOF > /etc/apt/sources.list.d/ddebs.list
deb http://ddebs.ubuntu.com/ $(lsb_release -cs) main restricted universe multiverse
deb http://ddebs.ubuntu.com/ $(lsb_release -cs)-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com/ $(lsb_release -cs)-proposed main restricted universe multiverse
EOF

curl -sL http://ddebs.ubuntu.com/dbgsym-release-key.asc | apt-key add -
# apt install ubuntu-dbgsym-keyring

apt-get update -y -qq

# Todo: These packages seem to be missing in Bionic 18.04
#    libegl1-mesa-dbgsym \
#    libgl1-mesa-glx-dbgsym \
#    libgl1-mesa-dri-dbgsym \
#    libglapi-mesa-dbgsym \
#    mesa-va-drivers-dbgsym \
#    libosmesa6-dbgsym \
#    libwayland-egl1-mesa-dbgsym \

apt-get install -q -y \
    libasound2 \
    libdbus-glib-1-2 \
    libglu1-mesa \
    libglu1-mesa-dbgsym \
    libcairo2-dbgsym \
    libosmesa6 \
    libpulse0 \
    mercurial \
    p7zip-full \
    python-dev \
    python-wheel \
    screen \
    subversion \
    ubuntu-restricted-addons \
    virtualenv \
    wget \
    zip

apt-get install -q -y --no-install-recommends \
    build-essential \
    gdb \
    libgtk-3-0 \
    libgtk-3-0-dbgsym \
    valgrind

/tmp/recipes/redis.sh
/tmp/recipes/radamsa.sh

apt-get clean -y
apt-get autoclean -y
apt-get autoremove -y

rm -rf /var/lib/apt/lists/*
rm -rf /root/.cache/*

# otherwise setup-grizzly.sh fails
pip uninstall -y numpy
pip install \
    psutil \
    virtualenv \
    git+https://github.com/cgoldberg/xvfbwrapper.git

chown -R worker:worker /home/worker

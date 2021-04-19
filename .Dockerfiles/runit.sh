#!/bin/bash

curl -L https://people.freedesktop.org/~slomo/gstreamer.tar.gz | tar xz
sed -i "s;prefix=/root/gstreamer;prefix=$PWD/gstreamer;g" $PWD/gstreamer/lib/x86_64-linux-gnu/pkgconfig/*.pc

cd /libdvbsi
git pull
autoreconf -i
./configure
make
make install

export PATH=$PATH:/gstreamer/bin
export LD_LIBRARY_PATH=/gstreamer/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
PKG_CONFIG_PATH=/gstreamer/lib/x86_64-linux-gnu/pkgconfig
GST_PLUGIN_SYSTEM_PATH=/gstreamer/lib/x86_64-linux-gnu/gstreamer-1.0
GST_PLUGIN_SCANNER=/gstreamer/libexec/gstreamer-1.0/gst-plugin-scanner

cd /tuxtxt
git pull
cd libtuxtxt
autoreconf -i
./configure --with-boxtype=generic DVB_API_VERSION=5
make
make install
cd ../tuxtxt
autoreconf -i
./configure --with-boxtype=generic DVB_API_VERSION=5
make
make install

cd /enigma2
git pull

autoreconf -i
./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0
make
python -m compileall .

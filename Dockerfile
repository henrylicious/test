FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN ["apt","update"]
RUN ["apt", "install", "-y",  \
"linux-libc-dev", "git", "build-essential", "libboost-all-dev", \
"automake", "libtool", "zlib1g-dev", "gettext", \
"swig", "libgstreamer1.0-dev", "libgstreamer-plugins-base1.0-dev", \
"libfreetype6-dev", "libsigc++-2.0-dev", "libxml2-dev", "libfribidi-dev", \
"libssl-dev", "libavahi-client-dev", "libjpeg-turbo8-dev", \
"libgif-dev"]

RUN ["apt", "install", "-y", "python3.8-dev", "python3-pip"]

RUN ln -sf /usr/bin/python3.8 /usr/bin/python
RUN python -m pip install --upgrade pip tox six
RUN python -V

RUN curl -L https://people.freedesktop.org/~slomo/gstreamer.tar.gz | tar xz
RUN sed -i "s;prefix=/root/gstreamer;prefix=$PWD/gstreamer;g" $PWD/gstreamer/lib/x86_64-linux-gnu/pkgconfig/*.pc

RUN git clone --depth 1 git://git.opendreambox.org/git/obi/libdvbsi++.git libdvbsi || true
RUN cd libdvbsi; git pull; autoreconf -i; ./configure; make; make install
#
RUN export PATH=$PATH:/gstreamer/bin
RUN export LD_LIBRARY_PATH=/gstreamer/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
RUN PKG_CONFIG_PATH=/gstreamer/lib/x86_64-linux-gnu/pkgconfig
RUN GST_PLUGIN_SYSTEM_PATH=/gstreamer/lib/x86_64-linux-gnu/gstreamer-1.0
RUN GST_PLUGIN_SCANNER=/gstreamer/libexec/gstreamer-1.0/gst-plugin-scanner
RUN git clone --depth 1 https://github.com/OpenPLi/tuxtxt.git
RUN cd tuxtxt/libtuxtxt; autoreconf -i; ./configure --with-boxtype=generic DVB_API_VERSION=5; make; make install; cd ../tuxtxt; autoreconf -i; ./configure --with-boxtype=generic DVB_API_VERSION=5; make; make install

RUN mkdir enigma2 || true
COPY . enigma2

RUN cd enigma2;  autoreconf -i; ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0; make; python -m compileall .

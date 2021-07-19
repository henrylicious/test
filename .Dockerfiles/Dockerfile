FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN ["apt","update"]
RUN ["apt", "install", "-y",  \
"linux-libc-dev", "git", "build-essential", \
"automake", "libtool", "zlib1g-dev", "gettext", \
"swig", "libgstreamer1.0-dev", "libgstreamer-plugins-base1.0-dev", \
"libfreetype6-dev", "libsigc++-2.0-dev", "libxml2-dev", "libfribidi-dev", \
"libssl-dev", "libavahi-client-dev", "libjpeg-turbo8-dev", \
"libgif-dev", "software-properties-common"]

ARG GCC=8
ARG PY=2.7
ARG BRANCH=master

RUN add-apt-repository ppa:ubuntu-toolchain-r/test; apt update; apt install -y python${PY}-dev g++-${GCC}
RUN ["apt","update"]
RUN [[ "$PY" == "2.7" ]] && apt install -y python-pip || apt install -y python3-pip
RUN apt-get clean

RUN [[ "$PY" != "2.7" ]] && ln -sf /usr/bin/python${PY} /usr/bin/python || true
RUN python -m pip install --upgrade pip tox six

RUN curl -L https://people.freedesktop.org/~slomo/gstreamer.tar.gz | tar xz
RUN sed -i "s;prefix=/root/gstreamer;prefix=$PWD/gstreamer;g" $PWD/gstreamer/lib/x86_64-linux-gnu/pkgconfig/*.pc

RUN git clone --depth 1 git://git.opendreambox.org/git/obi/libdvbsi++.git libdvbsi || true
WORKDIR libdvbsi
RUN git pull
RUN autoreconf -i
RUN ./configure
RUN make
RUN make install

RUN export PATH=$PATH:/gstreamer/bin
RUN export LD_LIBRARY_PATH=/gstreamer/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
RUN PKG_CONFIG_PATH=/gstreamer/lib/x86_64-linux-gnu/pkgconfig
RUN GST_PLUGIN_SYSTEM_PATH=/gstreamer/lib/x86_64-linux-gnu/gstreamer-1.0
RUN GST_PLUGIN_SCANNER=/gstreamer/libexec/gstreamer-1.0/gst-plugin-scanner

WORKDIR /
RUN git clone --depth 1 https://github.com/OpenPLi/tuxtxt.git || true
WORKDIR /tuxtxt/libtuxtxt
RUN autoreconf -i
RUN ./configure --with-boxtype=generic DVB_API_VERSION=5
RUN make
RUN make install
WORKDIR /tuxtxt/tuxtxt
RUN autoreconf -i
RUN ./configure --with-boxtype=generic DVB_API_VERSION=5
RUN make
RUN make install

RUN git clone --depth 1 --no-single-branch  https://github.com/henrylicious/test.git -b ${BRANCH} /enigma2 || true

WORKDIR /enigma2
RUN autoreconf -i
RUN ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0
RUN make
RUN python -m compileall .
RUN git checkout po


FROM dendes/e2-test:latest

SHELL ["/bin/bash", "-c"]

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
RUN git clone --depth 1 https://github.com/OpenPLi/tuxtxt.git || true
RUN cd tuxtxt/libtuxtxt; autoreconf -i; ./configure --with-boxtype=generic DVB_API_VERSION=5; make; make install; cd ../tuxtxt; autoreconf -i; ./configure --with-boxtype=generic DVB_API_VERSION=5; make; make install

RUN git clone https://github.com/henrylicious/test.git -b python3 enigma2 || true
RUN cd /enigma2/ ; git pull

RUN cd /enigma2;  autoreconf -i; ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0; make; python -m compileall .

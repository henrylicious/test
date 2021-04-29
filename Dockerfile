FROM dendes/e2-test:latest

SHELL ["/bin/bash", "-c"]

RUN export PATH=$PATH:/gstreamer/bin
RUN export LD_LIBRARY_PATH=/gstreamer/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
RUN PKG_CONFIG_PATH=/gstreamer/lib/x86_64-linux-gnu/pkgconfig
RUN GST_PLUGIN_SYSTEM_PATH=/gstreamer/lib/x86_64-linux-gnu/gstreamer-1.0
RUN GST_PLUGIN_SCANNER=/gstreamer/libexec/gstreamer-1.0/gst-plugin-scanner

RUN git clone --depth 1 https://github.com/henrylicious/test.git -b python3 enigma2 || true
RUN cd /enigma2/ ; git pull

RUN cd /enigma2;  autoreconf -i; ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0; make; python -m compileall .

#ENTRYPOINT bash /runit.sh

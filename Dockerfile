ARG GCC=8
ARG PY=27

FROM dendes/build-${GCC}-${PY}

SHELL ["/bin/bash", "-c"]

ARG GCC
ENV CC=gcc-$GCC CXX=g++-$GCC
RUN cd /enigma2; git pull; autoreconf -i; ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0; make; python -m compileall .

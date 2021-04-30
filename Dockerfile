ARG GCC=8
ARG PY=27
ARG BRANCH=master

FROM dendes/build-${GCC}-${PY}

SHELL ["/bin/bash", "-c"]

ARG GCC
ENV CC=gcc-$GCC CXX=g++-$GCC
RUN cd /enigma2
RUN git checkout $BRANCH
RUN git pull
RUN autoreconf -i
RUN ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0
RUN make
RUN python -m compileall .

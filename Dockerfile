ARG GCC=8
ARG PY=27

FROM dendes/build-${GCC}-${PY}
ARG CIRCLE_BRANCH=master

SHELL ["/bin/bash", "-c"]

ARG GCC=8
ENV CC=gcc-$GCC CXX=g++-$GCC
WORKDIR /enigma2
RUN git checkout $CIRCLE_BRANCH
RUN git pull
RUN autoreconf -i
RUN ./configure --with-libsdl=no --with-boxtype=nobox --enable-dependency-tracking ac_cv_prog_c_openmp=-fopenmp --with-textlcd --with-gstversion=1.0
RUN make
RUN python -m compileall .

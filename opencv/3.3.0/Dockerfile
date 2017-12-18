# Run opencv3.3.0 in a container
#
#docker build -t evoup/opencv3.3.0 .

# Base docker image


FROM evoup/python2.7
LABEL maintainer "evoup <evoex123@gmail.com>"
RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev \
        libavresample-dev \
        libgphoto2-dev \
        libgtk2.0-dev

WORKDIR /
RUN wget https://github.com/opencv/opencv/archive/3.3.0.zip \
&& unzip 3.3.0.zip \
&& mkdir /opencv-3.3.0/build \
&& cd /opencv-3.3.0/build \
&& cmake -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DENABLE_AVX=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python2.7 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python2.7) \
  -DPYTHON_INCLUDE_DIR=$(python2.7 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python2.7 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
&& make install \
&& rm /3.3.0.zip \
&& rm -r /opencv-3.3.0

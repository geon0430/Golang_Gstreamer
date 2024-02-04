#!/bin/bash

cd / && \
    mkdir -p /ffmpeg && cd /ffmpeg && \
    git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git && \
        cd nv-codec-headers && \
        git checkout sdk/12.0 && \
        make -j 8 && \
        make install && \
        ldconfig && \
        cd - && \
    git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/ && \
		cd ffmpeg && \
		./configure --enable-nonfree --enable-ffnvcodec --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared && \
        make -j 8 && \
        make install && \
        ldconfig

rm -r /ffmpeg
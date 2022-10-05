# Dependencies for Video Encoding
apt-get install libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev libdc1394-22-dev

# Opencv 4.6.0
cmake -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=OFF -D BUILD_ZLIB=OFF -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_LIST=core,java,imgcodec,video,videoio ..

# Opencv 4.4.0
cmake -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=OFF -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_LIST=core,java,imgcodec ..



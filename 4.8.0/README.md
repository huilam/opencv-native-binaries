# Dependencies for Video Encoding
apt-get install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev libdc1394-22-dev

apt-get install -y ffmpeg pkg-config 

apt-get install -y unzip wget cmake g++ openjdk-11-jdk ant python


# Optional Custom OpenCV path
-D CMAKE_PREFIX_PATH=/usr/local/Cellar/ffmpeg@5/5.1.3/

# Optional Java Build Environment

export JAVA_HOME=\`readlink -f $(which java) | sed "s:/bin/java::"\`

export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\`


# Opencv 4.8.0
cmake -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=OFF -D BUILD_ZLIB=OFF -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_LIST=core,java,imgcodec,video,videoio,feature2d,flann,calib3d,dnn,objdetect ..

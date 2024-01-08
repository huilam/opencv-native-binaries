# Dependencies for Video Encoding
apt-get install -y unzip wget cmake g++ openjdk-17-jdk ant python3

apt-get install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libdc1394-dev

apt-get install -y libjpeg62 libswresample-dev 

apt-get install -y ffmpeg pkg-config

apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

# Optional Java Build Environment

export JAVA_HOME=\`readlink -f $(which java) | sed "s:/bin/java::"\`

(macOS) export JAVA_HOME=\`/usr/libexec/java_home -v 11\`

export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\`

export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin

# Opencv 4.9.0`

cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D BUILD_SHARED_LIBS=OFF \
-D BUILD_ZLIB=OFF \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
-D OPENCV_JAVA_SOURCE_VERSION=11 \
-D OPENCV_JAVA_TARGET_VERSION=11 \
-D WITH_GSTREAMER=ON \
-D WITH_FFMPEG=ON \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D BUILD_LIST=core,java,imgcodec,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. 

FROM debian:11
#
ENV opencv_ver=4.9.0
ENV opencv_dir=/root/opencv

# 2024.0.0
# 2023.3.0
# 2022.3.1
ENV openvino_ver=2023.3.0
ENV openvino_ver_year=2023

# Update and install base and build dependencies
RUN apt update && \ 
    apt-get update && \
    apt-get -y install unzip wget cmake g++ build-essential pkg-config \
    openjdk-17-jdk ant python3

# Download and prepare OpenCV
RUN mkdir ${opencv_dir} && cd ${opencv_dir} && \
    wget -O opencv-${opencv_ver}.zip https://github.com/opencv/opencv/archive/refs/tags/${opencv_ver}.zip --no-check-certificate && \
    unzip opencv-${opencv_ver}.zip && \
    mkdir ${opencv_dir}/opencv-${opencv_ver}/build && \
    cd ${opencv_dir}/opencv-${opencv_ver} && \
    wget -O opencv_contrib-${opencv_ver}.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/${opencv_ver}.zip --no-check-certificate && \
    unzip opencv_contrib-${opencv_ver}.zip

RUN cd ${opencv_dir}/opencv-${opencv_ver}/ && \
    mkdir build/releases && \
    mkdir build/releases/base && \
    mkdir build/releases/with_ffmpeg && \
    mkdir build/releases/with_ffmpeg_gstreamer 


# Prepare to install OpenVINO 2022/2023/2024 
# Step 1: Download the GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB. You can also use the following command
# Step 2: Add this key to the system keyring
# Step 3: Add the repository via the following command
# Step 4: Update the list of packages via the update command
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB && \
apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB && \
echo "deb https://apt.repos.intel.com/openvino/2024 ubuntu20 main" | tee /etc/apt/sources.list.d/intel-openvino-2024.list && \
echo "deb https://apt.repos.intel.com/openvino/2023 ubuntu20 main" | tee /etc/apt/sources.list.d/intel-openvino-2023.list && \
apt update


# Install OpenVINO  
RUN apt-get install -y gnupg openvino-${openvino_ver}


# Set the JAVA_HOME and ANT_HOME environment variables & Build OpenCV
RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) && \
    export ANT_HOME=$(dirname $(dirname $(readlink -f $(which ant)))) && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_SHARED_LIBS=OFF \
    -D BUILD_ZLIB=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-${opencv_ver}/modules \
    -D OPENCV_JAVA_SOURCE_VERSION=11 \
    -D OPENCV_JAVA_TARGET_VERSION=11 \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D WITH_OPENVINO=ON \
    -D BUILD_LIST=core,imgcodec,java,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. | tee cmake-output.txt

RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    make -j 4 | tee make-output.txt && \ 
    cd ${opencv_dir}/opencv-${opencv_ver} && \
    mv build/bin/*.jar build/releases/base/ && \
    mv build/lib/*.so build/releases/base/ && \
    mv build/cmake-output.txt build/releases/base/ 

#################################################
# Install FFMpeg and related plugins
#################################################
RUN apt-get -y install ffmpeg libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libdc1394-dev libjpeg62 libswresample-dev 

# Set the JAVA_HOME and ANT_HOME environment variables & Build OpenCV
RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) && \
    export ANT_HOME=$(dirname $(dirname $(readlink -f $(which ant)))) && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_SHARED_LIBS=OFF \
    -D BUILD_ZLIB=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-${opencv_ver}/modules \
    -D OPENCV_JAVA_SOURCE_VERSION=11 \
    -D OPENCV_JAVA_TARGET_VERSION=11 \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D WITH_OPENVINO=ON \
    -D BUILD_LIST=core,imgcodec,java,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. | tee cmake-output.txt

RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    make -j 4 | tee make-output.txt && \
    cd ${opencv_dir}/opencv-${opencv_ver}/ && \
    mv build/bin/*.jar build/releases/with_ffmpeg/ && \
    mv build/lib/*.so build/releases/with_ffmpeg/ && \
    mv build/cmake-output.txt build/releases/with_ffmpeg/ 


#################################################
# Install GStreamer and related plugins
RUN apt-get -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio 

# Set the JAVA_HOME and ANT_HOME environment variables & Build OpenCV
RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) && \
    export ANT_HOME=$(dirname $(dirname $(readlink -f $(which ant)))) && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_SHARED_LIBS=OFF \
    -D BUILD_ZLIB=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-${opencv_ver}/modules \
    -D OPENCV_JAVA_SOURCE_VERSION=11 \
    -D OPENCV_JAVA_TARGET_VERSION=11 \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D WITH_OPENVINO=ON \
    -D BUILD_LIST=core,imgcodec,java,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. | tee cmake-output.txt

RUN cd ${opencv_dir}/opencv-${opencv_ver}/build && \
    make -j 4 | tee make-output.txt && \
    cd ${opencv_dir}/opencv-${opencv_ver}/ && \
    mv build/bin/*.jar build/releases/with_ffmpeg_gstreamer/ && \
    mv build/lib/*.so build/releases/with_ffmpeg_gstreamer/ && \
    mv build/cmake-output.txt build/releases/with_ffmpeg_gstreamer/ 

WORKDIR ${opencv_dir}/opencv-${opencv_ver}/build/releases


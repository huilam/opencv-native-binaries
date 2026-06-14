# Build Dependencies 
- [Debian & Ubuntu](./dep-debian.md)
- [MacOS](./dep-macos.md)

# Opencv 5.0.0
cmake \\\
-D CMAKE_BUILD_TYPE=RELEASE \\\
-D BUILD_SHARED_LIBS=OFF \\\
-D BUILD_ZLIB=OFF \\\
-D CMAKE_INSTALL_PREFIX=/usr/local \\\
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \\\
-D OPENCV_JAVA_SOURCE_VERSION=25 \\\
-D OPENCV_JAVA_TARGET_VERSION=25 \\\
-D WITH_FFMPEG=ON \\\
-D WITH_GSTREAMER=OFF \\\
-D WITH_CUDA=ON \\\
-D WITH_CUDNN=ON \\\
-D WITH_OPENVINO=OFF \\\
-D BUILD_LIST=core,java,imgcodec,video,videoio,features,flann,calib,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,tracking,cudev .. 

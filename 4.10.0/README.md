# Build Dependencies 
- [Debian & Ubuntu](./dep-debian.md)
- [MacOS](./dep-macos.md)

# Opencv 4.10.0
cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D BUILD_SHARED_LIBS=OFF \
-D BUILD_ZLIB=OFF \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
-D OPENCV_JAVA_SOURCE_VERSION=11 \
-D OPENCV_JAVA_TARGET_VERSION=11 \
-D WITH_FFMPEG=ON \
-D WITH_GSTREAMER=ON \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D WITH_INF_ENGINE=ON \
-D InferenceEngine_DIR=$OPENVINO_HOME/runtime/cmake \
-D ngraph_DIR=$OPENVINO_HOME/runtime/cmake \
-D BUILD_LIST=core,java,imgcodec,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. 

# Build Dependencies 
- Debian & Ubuntu 
- MacOS

# Opencv 4.9.0
cmake \
-DCMAKE_BUILD_TYPE=RELEASE \
-DBUILD_SHARED_LIBS=OFF \
-DBUILD_ZLIB=OFF \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
-DOPENCV_JAVA_SOURCE_VERSION=11 \
-DOPENCV_JAVA_TARGET_VERSION=11 \
-DWITH_FFMPEG=ON \
-DWITH_GSTREAMER=ON \
-DWITH_CUDA=ON \
-DWITH_CUDNN=ON \
-DBUILD_LIST=core,java,imgcodec,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. 

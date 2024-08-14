# Build Dependencies 
- [Debian & Ubuntu](./dep-debian.md)
- [MacOS](./dep-macos.md)

# Opencv 4.9.0
cmake \\ <br>
-DCMAKE_BUILD_TYPE=RELEASE \\ <br>
-DBUILD_SHARED_LIBS=OFF \\ <br>
-DBUILD_ZLIB=OFF \\ <br>
-DCMAKE_INSTALL_PREFIX=/usr/local \\ <br>
-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \\ <br>
-DOPENCV_JAVA_SOURCE_VERSION=11 \\ <br>
-DOPENCV_JAVA_TARGET_VERSION=11 \\ <br>
-DWITH_FFMPEG=ON \\ <br>
-DWITH_GSTREAMER=ON \\ <br>
-DWITH_CUDA=ON \\ <br>
-DWITH_CUDNN=ON \\ <br>
-DBUILD_LIST=core,java,imgcodec,video,videoio,feature2d,flann,calib3d,objdetect,dnn,dnn_superres,dnn_objdetect,superres,face,text,cudev .. 

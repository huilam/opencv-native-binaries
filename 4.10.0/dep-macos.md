# for MACOS

install homebrew from https://brew.sh/

# Build dependencies 
brew install wget curl unzip <br>
brew install cmake pkg-config <br>
brew install python3 ant openjdk libdc1394

# Optional OpenVINO
brew install openvino <br>
export OPENVINO_HOME=/opt/intel/openvino_xxx

# Optional FFMpeg 
brew install ffmpeg

# Optional GStreamer
brew install gstreamer

# Java Build Environment
export JAVA_HOME=\`/usr/libexec/java_home -v 11\` <br>
export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\` <br>
export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin 

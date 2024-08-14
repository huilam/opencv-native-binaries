# for MACOS

install homebrew from https://brew.sh/

# Build dependencies 
brew install wget curl unzip <br>
brew install cmake pkg-config python3 <br>
brew install ant openjdk <br>
brew install libdc1394 <br>

# Optional OpenVINO
brew install openvino

# Optional FFMpeg 
brew install ffmpeg

# Optional GStreamer
brew install gstreamer

# Java Build Environment
export JAVA_HOME=\`/usr/libexec/java_home -v 11\` <br>
export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\` <br>
export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin 

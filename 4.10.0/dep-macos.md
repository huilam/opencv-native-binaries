# for MACOS

install homebrew from https://brew.sh/ <br>

# Build dependencies 
brew install wget curl unzip <br>
brew install cmake pkg-config <br>
brew install python3 ant openjdk libdc1394 <br>

# Optional OpenVINO
brew install openvino <br>

# Optional FFMpeg 
brew install ffmpeg <br>

# Optional GStreamer
brew install gstreamer <br>

# Java Build Environment
export JAVA_HOME=\`/usr/libexec/java_home -v 11\` <br>
export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\` <br>
export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin <br>

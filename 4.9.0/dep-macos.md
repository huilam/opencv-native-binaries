# for MACOS

# install homebrew from https://brew.sh/

# Build dependencies 
brew install wget curl unzip
brew install cmake pkg-config python3
brew install ant openjdk

# Optional FFMpeg 
brew install ffmpeg

# Optional GStreamer
brew install gstreamer

# Java Build Environment
export JAVA_HOME=\`/usr/libexec/java_home -v 11\` 

export ANT_HOME=\`readlink -f $(which ant) | sed "s:/bin/ant::"\` 

export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin 
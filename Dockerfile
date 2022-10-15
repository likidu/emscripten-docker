FROM emscripten/emsdk:latest

# Update CMake
RUN apt-get update && \
  apt-get install -y gpg && \
  wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null && \
  echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y cmake ninja-build flac libogg-dev libvorbis-dev libvorbisenc2 libvorbisfile3 libflac-dev freeglut3-dev libjpeg-dev libfreetype-dev libxrandr-dev libglew-dev libsndfile1-dev libopenal-dev libncurses5-dev libncursesw5-dev libsfml-dev && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

ENV TERM=xterm-256color
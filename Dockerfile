FROM emscripten/emsdk:latest

# Update CMake
RUN apt-get update && \
  apt-get install -y gpg && \
  wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null && \
  echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y cmake ninja-build libsfml-dev &&\
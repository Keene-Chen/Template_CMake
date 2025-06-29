# 第三方库编译流程

## opencv-4.11
### x86_64
```bash
mkdir opencv_build && cd opencv_build

sudo dnf install freetype-devel harfbuzz-devel make gcc gcc-c++ kernel-devel

# 下载 opencv 源码
wget https://github.com/opencv/opencv/archive/refs/tags/4.11.0.zip -O opencv-4.11.0.zip

# 下载 opencv_contrib 源码
wget https://github.com/opencv/opencv_contrib/archive/refs/tags/4.11.0.zip -O opencv_contrib-4.11.0.zip

cmake -B cmake-ninja -G Ninja \
  -D CMAKE_BUILD_TYPE=Release \
  -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.11.0/modules \
  -D CMAKE_INSTALL_PREFIX=/usr/local/keenechen/x86_64/opencv-4.11.0 \
  -D WITH_FREETYPE=ON \
  -D BUILD_opencv_freetype=ON \
  -D FREETYPE_FOUND=ON \
  -D FREETYPE_LIBRARIES=/lib64/libfreetype.so \
  -D FREETYPE_INCLUDE_DIRS=/usr/include/freetype2/ \
  -D HARFBUZZ_FOUND=ON \
  -D HARFBUZZ_LIBRARIES=/lib64/libharfbuzz.so \
  -D HARFBUZZ_INCLUDE_DIRS=/usr/include/harfbuzz/

cmake --build cmake-ninja -j8
cmake --install cmake-ninja
```

### aarch64
```bash
mkdir opencv_build && cd opencv_build

apt install libfreetype6-dev libharfbuzz-dev build-essential

# 下载 opencv 源码
wget https://github.com/opencv/opencv/archive/refs/tags/4.11.0.zip -O opencv-4.11.0.zip

# 下载 opencv_contrib 源码
wget https://github.com/opencv/opencv_contrib/archive/refs/tags/4.11.0.zip -O opencv_contrib-4.11.0.zip

cmake -B cmake-ninja -G Ninja \
  -D CMAKE_BUILD_TYPE=Release \
  -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.11.0/modules \
  -D CMAKE_INSTALL_PREFIX=/usr/local/keenechen/aarch64/opencv-4.11.0 \
  -D WITH_FREETYPE=ON \
  -D BUILD_opencv_freetype=ON \
  -D FREETYPE_FOUND=ON \
  -D FREETYPE_LIBRARIES=/lib/aarch64-linux-gnu/libfreetype.so \
  -D FREETYPE_INCLUDE_DIRS=/usr/include/freetype2/ \
  -D HARFBUZZ_FOUND=ON \
  -D HARFBUZZ_LIBRARIES=/lib/aarch64-linux-gnu/libharfbuzz.so \
  -D HARFBUZZ_INCLUDE_DIRS=/usr/include/harfbuzz/

cmake --build cmake-ninja -j8
cmake --install cmake-ninja
```


##
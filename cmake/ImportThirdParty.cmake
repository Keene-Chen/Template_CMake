# file    : ImportThirdParty.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:41:22
# details : ImportThirdParty

# 设置库路径(链接动态库,全部手动安装)
set(KC_LIBS_DIR "/usr/local/keenechen/x86_64")

# OpenCV 4.11.0 and OpenCV Contrib 4.11.0
include(FindLocalOpenCV)

# Boost 1.88.0
include(FindLocalBoost)

# gRPC 1.71.0
include(FindLocalGRPC)

# serial 1.2.1
# include(FindLocalSerial)

# libhv 1.3.3
include(FindLocalLibhv)

# spdlog 1.15.3
include(FindLocalSpdlog)

# fmt 11.2.0
# include(FetchFmt)

# nlohmann 3.12.0
include(FindLocalNlohmannJson)

# yaml-cpp 0.8.0
# include(FetchYamlCpp)

# toml11 4.4.0
# include(FetchToml11)

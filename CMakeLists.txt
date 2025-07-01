# file    : CMakeLists.txt
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:27:08
# details : CMakeLists

cmake_minimum_required(VERSION 3.20...3.30)

set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

# set(COMPILE_PATH /usr/bin)
# set(CMAKE_C_COMPILER ${COMPILE_PATH}/clang)
# set(CMAKE_CXX_COMPILER ${COMPILE_PATH}/clang++)

# set(CMAKE_C_COMPILER_LAUNCHER "ccache")
# set(CMAKE_CXX_COMPILER_LAUNCHER "ccache")
project(
    template_cmake
    VERSION 1.0.0
    DESCRIPTION "template_cmake"
    HOMEPAGE_URL "https://github.com/Keene-Chen/Template_CMake"
    LANGUAGES C CXX
)

# 包含公共模块与第三方库模块
set(FETCHCONTENT_BASE_DIR ${CMAKE_SOURCE_DIR}/_deps)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(CMakePrintHelpers)
include(CommonConfig)
include(ImportThirdParty)

option(KC_BUILD_TESTS "KC build tests." ON)

# 开启测试
enable_testing()

# 添加子目录
add_subdirectory(src)

if(${KC_BUILD_TESTS})
    add_subdirectory(test)
endif()

# add_subdirectory(third_party)

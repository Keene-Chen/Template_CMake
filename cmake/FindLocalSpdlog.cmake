# file    : FindLocalSpdlog.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:14:24
# details : FindLocalSpdlog

set(spdlog_DIR "${KC_LIBS_DIR}/spdlog-1.15.3/lib64/cmake/spdlog")
find_package(spdlog REQUIRED)

if(spdlog_FOUND)
    kc_message(cyan "✔ spdlog version : [${spdlog_VERSION}]")
else()
    kc_message(red "✘ spdlog not found.")
endif()

# file    : FindLocalNlohmannJson.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:16:46
# details : FindLocalNlohmannJson

include_directories(${CMAKE_SOURCE_DIR}/third_party)

if(TRUE)
    # kc_message(green "✔ found nlohmann/json at: 3.12.0")
    kc_message(cyan "✔ nlohmann/json version : [3.12.0]")
else()
    kc_message(red "✘ nlohmann/json not found.")
endif()

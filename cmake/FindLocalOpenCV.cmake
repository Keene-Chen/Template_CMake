# file    : FindLocalOpencv.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:15:57
# details : FindLocalOpencv

set(OpenCV_DIR "${KC_LIBS_DIR}/opencv-4.11.0/lib64/cmake/opencv4")
find_package(OpenCV REQUIRED)

if(OpenCV_FOUND)
    # kc_message(green "✔ found opencv at: ${OpenCV_DIR}")
    # kc_message(green "OpenCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
    # kc_message(green "OpenCV_LIBS: ${OpenCV_LIBS}")
    kc_message(cyan "✔ opencv version : [${OpenCV_VERSION}]")
else()
    kc_message(red "✘ opencv not found.")
endif()

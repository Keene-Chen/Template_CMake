# file    : FindLocalLibhv.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:12:52
# details : FindLocalLibhv

set(libhv_DIR "${KC_LIBS_DIR}/libhv-1.3.3/lib/cmake/libhv")
find_package(libhv REQUIRED)

if(libhv_FOUND)
    get_target_property(HV_LIB_DIR hv IMPORTED_LOCATION_NOCONFIG)

    # kc_message(green "✔ found libhv at: ${HV_LIB_DIR}")
    kc_message(cyan "✔ libhv version : [1.3.3]")
else()
    kc_message(red "✘ libhv not found.")
endif()

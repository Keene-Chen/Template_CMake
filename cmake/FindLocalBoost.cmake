# file    : FindLocalBoost.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:08:15
# details : FindLocalBoost

set(Boost_DIR "${KC_LIBS_DIR}/boost-1.88.0/lib/cmake/Boost-1.88.0")
find_package(Boost REQUIRED COMPONENTS system filesystem thread process)

if(Boost_FOUND)
    # kc_message(green "✔ found boost at: ${Boost_DIR}")
    kc_message(cyan "✔ boost version : [${Boost_VERSION}]")
else()
    kc_message(red "✘ boost not found.")
endif()

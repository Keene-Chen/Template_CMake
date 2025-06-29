# file    : CMakeLists.txt
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-23:16:26
# details : CMakeLists

project(utils VERSION 0.0.1 LANGUAGES C CXX)

# fix: 多久目录输出二进制文件设置
kc_output_artifacts_with_parent()

file(GLOB_RECURSE source_files ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)
file(GLOB_RECURSE test_files ${CMAKE_CURRENT_SOURCE_DIR}/*_test.cc)

add_library(utils STATIC ${source_files})
add_library(kc::utils ALIAS utils)
target_include_directories(utils PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(utils PUBLIC spdlog::spdlog)

foreach(test_src IN LISTS test_files)
    get_filename_component(test_name ${test_src} NAME_WE)
    add_executable(${test_name} ${test_src})
    target_link_libraries(${test_name} PRIVATE kc::utils)
endforeach()

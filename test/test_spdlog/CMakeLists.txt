# file    : CMakeLists.txt
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-00:47:41
# details : CMakeLists

project(test_spdlog VERSION 0.0.1 LANGUAGES CXX)

kc_output_artifacts_with_parent()

add_executable(test_spdlog test_spdlog.cc)
target_link_libraries(test_spdlog PRIVATE spdlog::spdlog)

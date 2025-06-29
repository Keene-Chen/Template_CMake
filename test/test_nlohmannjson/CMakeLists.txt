# file    : CMakeLists.txt
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.29-01:00:21
# details : CMakeLists

project(test_nlohmannjson VERSION 0.0.1 LANGUAGES CXX)

kc_output_artifacts_with_parent()

add_executable(test_nlohmannjson test_nlohmannjson.cc)

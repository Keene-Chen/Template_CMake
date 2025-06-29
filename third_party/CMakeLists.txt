project(test_3rd DESCRIPTION "test_3rd")

# 是否构建动态库
option(BUILD_SHARED_LIBS "Build shared libraries" ON)

# cJSON
add_library(cJSON "")
target_sources(
  cJSON
  PRIVATE ${CMAKE_CURRENT_LIST_DIR}/cJSON/cJSON.c
  PUBLIC ${CMAKE_CURRENT_LIST_DIR}/cJSON/cJSON.h)
target_include_directories(cJSON PUBLIC ${CMAKE_CURRENT_LIST_DIR}/cJSON)
kc_message(magenta "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libcJSON.so")

# cJSON_Utils
add_library(cJSON_Utils "")
target_sources(
  cJSON_Utils
  PRIVATE ${CMAKE_CURRENT_LIST_DIR}/cJSON/cJSON_Utils.c
  PUBLIC ${CMAKE_CURRENT_LIST_DIR}/cJSON/cJSON_Utils.h)
target_include_directories(cJSON_Utils PUBLIC ${CMAKE_CURRENT_LIST_DIR}/cJSON)
kc_message(magenta "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libcJSON_Utils.so")

# inih
add_library(inih "")
target_sources(
  inih
  PRIVATE ${CMAKE_CURRENT_LIST_DIR}/inih/ini.c
  PUBLIC ${CMAKE_CURRENT_LIST_DIR}/inih/ini.h)
target_include_directories(inih PUBLIC ${CMAKE_CURRENT_LIST_DIR}/inih)
kc_message(magenta "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libinih.so")

# log
add_library(log "")
target_sources(
  log
  PRIVATE ${CMAKE_CURRENT_LIST_DIR}/log.c/src/log.c
  PUBLIC ${CMAKE_CURRENT_LIST_DIR}/log.c/src/log.h)
target_include_directories(log PUBLIC ${CMAKE_CURRENT_LIST_DIR}/log.c/src)
target_compile_definitions(log PRIVATE -DLOG_USE_COLOR)
kc_message(magenta "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/liblog.so")

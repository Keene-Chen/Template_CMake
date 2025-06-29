# file    : CommonConfig.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:32:37
# details : cmake 公共配置文件

#[[
# colorize CMake output code adapted from stackoverflow:
# http://stackoverflow.com/a/19578320 from post authored by
# https://stackoverflow.com/users/2556117/fraser
#]]

# >>> color define >>>
macro(enable_kc_colors)
  if(WIN32)
    # has no effect on WIN32
    set(CReset "")
    set(ColourBold "")
    set(Red "")
    set(Green "")
    set(Yellow "")
    set(Blue "")
    set(Magenta "")
    set(Cyan "")
    set(White "")
    set(BRed "")
    set(BGreen "")
    set(BYellow "")
    set(BBlue "")
    set(BMagenta "")
    set(BCyan "")
    set(BWhite "")
  else()
    string(ASCII 27 Esc)
    set(CReset "${Esc}[m")
    set(ColourBold "${Esc}[1m")
    set(Red "${Esc}[31m")
    set(Green "${Esc}[32m")
    set(Yellow "${Esc}[33m")
    set(Blue "${Esc}[34m")
    set(Magenta "${Esc}[35m")
    set(Cyan "${Esc}[36m")
    set(White "${Esc}[37m")
    set(BRed "${Esc}[1;31m")
    set(BGreen "${Esc}[1;32m")
    set(BYellow "${Esc}[1;33m")
    set(BBlue "${Esc}[1;34m")
    set(BMagenta "${Esc}[1;35m")
    set(BCyan "${Esc}[1;36m")
    set(BWhite "${Esc}[1;37m")
  endif()
endmacro()

# <<< color define <<<

# >>> message color define >>>
macro(kc_message color text)
  if(${color} STREQUAL "red")
    message(STATUS "${BRed}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "green")
    message(STATUS "${BGreen}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "yellow")
    message(STATUS "${BYellow}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "blue")
    message(STATUS "${BBlue}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "magenta")
    message(STATUS "${BMagenta}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "cyan")
    message(STATUS "${BCyan}>>> ${text} ${CReset}")
  elseif(${color} STREQUAL "white")
    message(STATUS "${BWhite}>>> ${text} ${CReset}")
  endif()
endmacro()

macro(kc_msg text)
  message(STATUS "${BYellow}>>> ${text} ${CReset}")
endmacro()

# <<< message color define <<<

# >>> debug information >>>
macro(enable_kc_debug)
  # 顶层项目信息
  kc_msg("Name            ${BRed}│ ${PROJECT_NAME}")
  kc_msg("Version         ${BRed}│ ${PROJECT_VERSION}")
  kc_msg("Homepage        ${BRed}│ ${PROJECT_HOMEPAGE_URL}")
  kc_msg("Description     ${BRed}│ ${PROJECT_DESCRIPTION}")

  # 设置默认构建类型
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build Type" FORCE)
  endif()

  # CMake 调试信息
  string(TIMESTAMP BUILD_TIMESTAMP "%Y.%m.%d-%H:%M:%S")
  kc_msg("CMake System    ${BRed}│ ${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
  kc_msg("CMake Version   ${BRed}│ ${CMAKE_VERSION}")
  kc_msg("CMake Generator ${BRed}│ ${CMAKE_GENERATOR}")
  kc_msg("Build Type      ${BRed}│ ${CMAKE_BUILD_TYPE}")
  kc_msg("Build DateTime  ${BRed}│ ${BUILD_TIMESTAMP}")

  # 设置CMAKE_VERBOSE_MAKEFILE为ON,以显示详细信息
  set(CMAKE_VERBOSE_MAKEFILE OFF)

  # 导出编译命令配置,供clangd使用
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endmacro()

enable_kc_colors()
enable_kc_debug()

# <<< debug information <<<

# >>> output artifacts >>>
macro(kc_output_artifacts)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PROJECT_NAME})

  # set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_SOURCE_DIR}/bin/minsizerel/${PROJECT_NAME})
  # set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_SOURCE_DIR}/bin/relwithdebinfo/${PROJECT_NAME})
  # set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/bin/release/${PROJECT_NAME})
  # set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/bin/debug/${PROJECT_NAME})
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PROJECT_NAME})
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PROJECT_NAME})
endmacro()

macro(kc_output_artifacts_with_parent)
  get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
  get_filename_component(PARENT_DIR_NAME ${PARENT_DIR} NAME)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PARENT_DIR_NAME}/${PROJECT_NAME})
endmacro(kc_output_artifacts_with_parent)

# <<< output artifacts <<<

#!/usr/bin/bash
# file    : build.sh
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:22:48
# details : 构建项目脚本

# 定义颜色码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
Magenta='\033[0;35m'
CYAN='\033[0;36m'
White='\033[0;37m'
NC='\033[0m'

# 定义时间戳
timestamp=$(date +"[%Y-%m-%d %H:%M:%S]")

echo_error() {
    echo -e "${RED}$*${NC}"
}
echo_warning() {
    echo -e "${YELLOW}$*${NC}"
}
echo_info() {
    echo -e "${CYAN}$*${NC}"
}
echo_success() {
    echo -e "${GREEN}$*${NC}"
}
echo_debug() {
    echo -e "${YELLOW}$*${NC}"
}
echo_error_with_timestamp() {
    echo -e "${timestamp} ${RED}$*${NC}"
}
echo_warning_with_timestamp() {
    echo -e "${timestamp} ${YELLOW}$*${NC}"
}
echo_info_with_timestamp() {
    echo -e "${timestamp} ${CYAN}$*${NC}"
}
echo_success_with_timestamp() {
    echo -e "${timestamp} ${GREEN}$*${NC}"
}
echo_debug_with_timestamp() {
    echo -e "${timestamp} ${YELLOW}$*${NC}"
}

# show usage
show_help() {
    echo -e "Usage:\e[41m $0 [-h|--help|help] [n|ninja|Ninja] [c|cls|clean|clear] \e[0m\n"
    echo_info "Options:"
    echo_info "  -h, --help, help   Show this help message and exit."
    echo_info "  c, clean            Clean up generated files and directories."
    echo_info "  n, ninja, Ninja      Use Ninja as the build tool. \n"
    echo_debug "If no build tool is specified, 'Unix Makefiles' will be used by default."
}

# 处理命令行参数
case "$1" in
-h | --help | h | help)
    show_help
    exit 0
    ;;
c | cls | clean | clear)
    echo_info_with_timestamp "清理生成的文件和目录..."
    rm -rf _deps bin cmake-build cmake-ninja cmake-vscode logs
    echo_success_with_timestamp "清理完成！"
    exit 0
    ;;
n | ninja | Ninja)
    BUILD_TOOL=Ninja
    BUILD_DIR=cmake-ninja
    shift # 移除已处理的参数
    ;;
*)
    BUILD_TOOL=${1:-"Unix Makefiles"}
    BUILD_DIR=cmake-build
    ;;
esac

# 设置源代码树的顶层目录和默认构建输出目录
SOURCE_DIR=.

# 创建构建目录（如果不存在）
mkdir -p ${BUILD_DIR}

# 配置CMake生成构建系统
cmake -S ${SOURCE_DIR} -B ${BUILD_DIR} -G "${BUILD_TOOL}"

# 检查配置命令是否成功
if [ $? -eq 0 ]; then
    # 使用指定的构建工具进行构建，并利用所有可用的核心
    echo_info_with_timestamp ">>> 使用 ${BUILD_TOOL} 开始构建... >>>"
    cmake --build ${BUILD_DIR} --parallel $(nproc)
else
    echo_error_with_timestamp "CMake 配置失败, 请检查您的环境和 CMakeLists.txt 文件"
    show_help
    exit 1
fi

echo_info_with_timestamp "<<< 构建完成! <<<"

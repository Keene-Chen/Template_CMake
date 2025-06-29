/**
 * @file    : utils_spdlog_test.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:22:43
 * @details : utils_spdlog_test
 */

#include "utils_spdlog.h"

int main()
{
    kc::utils::Logger::Init("kc");
    spdlog::info("hello world");
    spdlog::error("hello world");
    spdlog::warn("hello world");
    spdlog::critical("hello world");
    spdlog::debug("hello world");
    spdlog::trace("hello world");

    return 0;
}
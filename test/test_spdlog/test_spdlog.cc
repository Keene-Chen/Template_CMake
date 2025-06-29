/**
 * @file    : test_spdlog.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-00:57:56
 * @details : test_spdlog
 */

#include "spdlog/spdlog.h"
#include <iostream>

int main()
{
    spdlog::info("info message");
    spdlog::error("error message");
    spdlog::warn("warning message");
    spdlog::critical("critical message");
    spdlog::trace("trace message");
    spdlog::debug("debug message");

    return 0;
}
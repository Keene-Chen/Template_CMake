/**
 * @file    : utils_time_test.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:10:20
 * @details : utils_time_test
 */

#include "utils_time.h"
#include <iostream>

int main()
{
    using namespace kc::utils;

    std::cout << Time::GetCurrentTimeString("%Y-%m-%d %H:%M:%S") << std::endl;
    std::cout << Time::GetCurrentTimeString(0) << std::endl;
    std::cout << Time::GetCurrentTimeString(1) << std::endl;
    std::cout << Time::GetCurrentTimeString(2) << std::endl;
    std::cout << Time::GetUnixTimestamp() << std::endl;
    std::cout << Time::GetUnixTimestamp(true) << std::endl;
}

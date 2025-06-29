/**
 * @file    : utils_time.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:10:24
 * @details : utils_time
 */

#include "utils_time.h"
#include <chrono>
#include <ctime>
#include <iomanip>
#include <sstream>

namespace kc::utils
{

// 获取当前时间
std::string Time::GetCurrentTimeString(std::string format)
{
    if (format.empty()) {
        // format = "%Y-%m-%d %H:%M:%S";
        format = "%Y%m%d_%H%M%S";
    }

    auto now = std::chrono::system_clock::now();
    auto ms  = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()) % 1000;
    auto in_time_t = std::chrono::system_clock::to_time_t(now);

    std::ostringstream oss;
    oss << std::put_time(std::localtime(&in_time_t), format.c_str()) << std::setfill('0')
        << std::setw(3) << ms.count();

    return oss.str();
}

// 获取当前时间
std::string Time::GetCurrentTimeString(int format_mode)
{
    switch (format_mode) {
    case 0:
        return GetCurrentTimeString("%Y-%m-%d %H:%M:%S");
    case 1:
        return GetCurrentTimeString("%Y%m%d_%H%M%S");
    case 2:
        return GetCurrentTimeString("%Y%m%d %H%M%S");
    default:
        return GetCurrentTimeString("%Y%m%d_%H%M%S");
    }
}

// 获取 Unix 时间戳（秒级或毫秒级）
int64_t Time::GetUnixTimestamp(bool with_milliseconds)
{
    auto now      = std::chrono::system_clock::now();
    auto duration = now.time_since_epoch();

    if (with_milliseconds) {
        return std::chrono::duration_cast<std::chrono::milliseconds>(duration).count();
    } else {
        return std::chrono::duration_cast<std::chrono::seconds>(duration).count();
    }
}

} // namespace kc::utils
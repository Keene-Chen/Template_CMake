/**
 * @file    : utils_time.h
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:10:27
 * @details : utils_time
 */

#ifndef __UTILS_TIME_H__
#define __UTILS_TIME_H__

#include <string>

namespace kc::utils
{

class Time
{
  public:
    static std::string GetCurrentTimeString(std::string format);
    static std::string GetCurrentTimeString(int format_mode);
    static int64_t GetUnixTimestamp(bool with_milliseconds = false);
};

} // namespace kc::utils

#endif // __UTILS_TIME_H__
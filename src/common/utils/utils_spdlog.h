/**
 * @file    : utils_spdlog.h
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:23:02
 * @details : utils_spdlog
 */

#ifndef __UTILS_SPDLOG_H__
#define __UTILS_SPDLOG_H__

#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/sinks/basic_file_sink.h"
#include <string>

namespace kc::utils
{

int logger_init();
class Logger
{
  public:
    explicit Logger(const std::string &filename);
    ~Logger() = default;

  public:
    static Logger &Init(const std::string &filename = "")
    {
        static Logger init(filename);
        return init;
    }

    // 禁止拷贝和赋值
    Logger(const Logger &)            = delete;
    Logger &operator=(const Logger &) = delete;
};

} // namespace kc::utils

#endif // __UTILS_SPDLOG_H__
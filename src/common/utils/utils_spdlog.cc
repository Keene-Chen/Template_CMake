/**
 * @file    : utils_spdlog.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-23:24:20
 * @details : utils_spdlog
 */

#include "utils_spdlog.h"
#include <iostream>
#include <sstream>
#include <string>
#include <chrono>
#include <vector>
#include <ctime>
#include <iomanip>

namespace kc::utils
{

Logger::Logger(const std::string &filename)
{
    using namespace std::chrono;

    auto now      = system_clock::now();
    auto ms       = duration_cast<milliseconds>(now.time_since_epoch()) % 1000;
    auto now_time = system_clock::to_time_t(now);

    std::ostringstream oss;
    oss << "logs/" << filename << "_";
    oss << std::put_time(std::localtime(&now_time), "%Y%m%d_%H%M%S");
    oss << std::setw(3) << std::setfill('0') << ms.count();
    oss << ".log";

    // 创建两个 sink
    auto console_sink = std::make_shared<spdlog::sinks::stdout_color_sink_mt>();
    // true 表示追加写入
    auto file_sink = std::make_shared<spdlog::sinks::basic_file_sink_mt>(oss.str(), true);

    // 设置输出格式（可选）
    console_sink->set_pattern("[%Y-%m-%d %H:%M:%S] [%^%l%$] %v");
    file_sink->set_pattern("[%Y-%m-%d %H:%M:%S.%e] [%l] %v");

    // 创建多 sink logger
    std::vector<spdlog::sink_ptr> sinks{ console_sink, file_sink };
    auto logger = std::make_shared<spdlog::logger>("multi_sink", sinks.begin(), sinks.end());

    // 设置全局 logger（可选）
    spdlog::set_default_logger(logger);
    spdlog::set_level(spdlog::level::debug); // 设置日志等级
    spdlog::flush_on(spdlog::level::info);   // info 级别以上立即 flush 到文件
}

} // namespace kc::utils
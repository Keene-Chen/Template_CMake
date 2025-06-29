/**
 * @file    : test_nlohmannjson.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.29-01:01:47
 * @details : test_nlohmannjson
 */

#include "nlohmann/json.hpp"
#include <iostream>

using json = nlohmann::json;

int main()
{
    json ex1 = json::parse(R"(
        {
            "pi": 3.141,
            "happy": true
        }
    )");

    std::cout << ex1["pi"] << std::endl;

    return 0;
}
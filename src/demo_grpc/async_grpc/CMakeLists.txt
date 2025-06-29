# file    : CMakeLists.txt
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:45:23
# details : CMakeLists

# 设置 proto 文件路径
set(PROTO_FILE_NAME async_grpc)
set(PROTO_FILE "${CMAKE_CURRENT_SOURCE_DIR}/protos/${PROTO_FILE_NAME}.proto")
get_filename_component(PROTO_DIR "${PROTO_FILE}" DIRECTORY)

# 自动生成输出文件路径
set(GENERATED_PROTO_HDR "${PROTO_DIR}/${PROTO_FILE_NAME}.pb.h")
set(GENERATED_PROTO_SRC "${PROTO_DIR}/${PROTO_FILE_NAME}.pb.cc")
set(GENERATED_GRPC_HDR "${PROTO_DIR}/${PROTO_FILE_NAME}.grpc.pb.h")
set(GENERATED_GRPC_SRC "${PROTO_DIR}/${PROTO_FILE_NAME}.grpc.pb.cc")

# 代码生成命令
add_custom_command(
    OUTPUT
    "${GENERATED_PROTO_SRC}"
    "${GENERATED_PROTO_HDR}"
    "${GENERATED_GRPC_SRC}"
    "${GENERATED_GRPC_HDR}"
    COMMAND ${_PROTOBUF_PROTOC}
    ARGS
    --cpp_out "${PROTO_DIR}"
    --grpc_out "${PROTO_DIR}"
    -I "${PROTO_DIR}"
    --plugin=protoc-gen-grpc="${_GRPC_CPP_PLUGIN_EXECUTABLE}" "${PROTO_FILE}"
    DEPENDS "${PROTO_FILE}"
    COMMENT "Generating gRPC code from ${PROTO_FILE}"
)

# 创建库目标,合并文件列表
add_library(${PROTO_FILE_NAME}
    ${GENERATED_PROTO_SRC}
    ${GENERATED_PROTO_HDR}
    ${GENERATED_GRPC_SRC}
    ${GENERATED_GRPC_HDR}
)

# 统一链接库配置
target_include_directories(${PROTO_FILE_NAME} PUBLIC "${PROTO_DIR}")
target_link_libraries(${PROTO_FILE_NAME} PRIVATE
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
)

# 设置链接库路径
set(GRPC_CPP_LIB ${PROTO_FILE_NAME}
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
)

# 设置可执行文件路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/src/${PROJECT_NAME})

# 添加客户端可执行文件
add_executable(${PROTO_FILE_NAME}_client client/greeter_client.cc)
target_link_libraries(${PROTO_FILE_NAME}_client ${GRPC_CPP_LIB})

# 添加服务端可执行文件
add_executable(${PROTO_FILE_NAME}_server server/greeter_server.cc)
target_link_libraries(${PROTO_FILE_NAME}_server ${GRPC_CPP_LIB})

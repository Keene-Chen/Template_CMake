# file    : FindLocalGRPC.cmake
# author  : KeeneChen <keenechen@qq.com>
# date    : 2025.06.17-17:40:25
# details : FindLocalGRPC

# x86_64  /usr/local/keenechen/x86_64/grpc-1.71.0/lib64
# aarch64 /usr/local/keenechen/aarch64/grpc-1.71.0/lib
set(GRPC_PATH ${KC_LIBS_DIR}/grpc-1.71.0)
set(absl_DIR ${GRPC_PATH}/lib64/cmake/absl)
set(utf8_range_DIR ${GRPC_PATH}/lib64/cmake/utf8_range)
set(Protobuf_DIR ${GRPC_PATH}/lib64/cmake/protobuf)
set(protobuf_MODULE_COMPATIBLE TRUE)

find_package(Protobuf CONFIG REQUIRED)
set(_PROTOBUF_LIBPROTOBUF protobuf::libprotobuf)
set(_REFLECTION gRPC::grpc++_reflection)

if(CMAKE_CROSSCOMPILING)
    find_program(_PROTOBUF_PROTOC protoc)
else()
    set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
endif()

set(gRPC_DIR ${GRPC_PATH}/lib/cmake/grpc)
find_package(gRPC CONFIG REQUIRED)
set(_GRPC_GRPCPP gRPC::grpc++)

if(CMAKE_CROSSCOMPILING)
    find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
else()
    set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)
endif()

if(Protobuf_FOUND)
    # kc_message(green "✔ found protobuf at: ${Protobuf_DIR}")
    kc_message(cyan "✔ protobuf version : [${Protobuf_VERSION}]")
else()
    kc_message(red "✘ protobuf not found.")
endif()

if(gRPC_FOUND)
    # kc_message(green "✔ found gRPC     at: ${gRPC_DIR}")
    kc_message(cyan "✔ gRPC     version : [${gRPC_VERSION}]")
else()
    kc_message(red "✘ gRPC     not found.")
endif()

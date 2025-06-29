/**
 * @file    : greeter_client.cc
 * @author  : KeeneChen <keenechen@qq.com>
 * @date    : 2025.06.17-17:47:05
 * @details : greeter_client
 */

#include "async_grpc.grpc.pb.h"
#include <grpcpp/grpcpp.h>
#include <iostream>
#include <memory>
#include <string>

using async_grpc::Greeter;
using async_grpc::HelloReply;
using async_grpc::HelloRequest;
using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;

class GreeterClient
{
  public:
    explicit GreeterClient(std::shared_ptr<Channel> channel) : stub_(Greeter::NewStub(channel)) {}

    std::string SayHello(const std::string &user)
    {
        HelloRequest request;
        request.set_name(user);

        HelloReply reply;
        ClientContext context;

        Status status = stub_->SayHello(&context, request, &reply);

        if (status.ok()) {
            return reply.message();
        } else {
            std::cout << status.error_code() << ": " << status.error_message() << std::endl;
            return "RPC failed";
        }
    }

  private:
    std::unique_ptr<Greeter::Stub> stub_;
};

int main(int /*argc*/, char ** /*argv*/)
{
    GreeterClient greeter(
        grpc::CreateChannel("localhost:50051", grpc::InsecureChannelCredentials()));
    std::string user("world");
    std::string reply = greeter.SayHello(user);
    std::cout << "Greeter received: " << reply << std::endl;

    return 0;
}
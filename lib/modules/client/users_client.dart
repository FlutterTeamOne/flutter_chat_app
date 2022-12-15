import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:chat_app/src/generated/messages/messages.pbgrpc.dart';
import 'package:grpc/service_api.dart';

Future<void> main() async {

  final _channel = GrpcClient().channel;

  UserClient().getUser(id: 1);
}

class UserClient extends GrpcClient {
  Future getUser({required int id}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
      options: CallOptions(timeout: Duration(seconds: 30)));

    var request = GetUserRequest()
      ..id = 1
      ..name = 'test1'
      ..email = 't1@t1.t1'
      ..dateCreation = '2022-12-02T21:36:32.653712'
    ;
    var user = await stub.getUser(request);
    print (user);
  }
}



import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:chat_app/src/generated/messages/messages.pbgrpc.dart';
import 'package:grpc/service_api.dart';

class UserClient extends GrpcClient {
  Future getUser({required int id}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));

    var request = GetUserRequest()
      ..id = 1
      ..name = 'test1'
      ..email = 't1@t1.t1'
      ..dateCreation = '2022-12-02T21:36:32.653712';
    var response = await stub.getUser(request);
    print(response);
    return UserDto(
      userId: response.id,
      name: response.name, 
      email: response.email, 
      password: response.password, 
      registrationDate: response.dateCreated, 
      profilePicLink: response.profilePicUrl, 
      updatedDate: response.dateCreated);
  }

  Future createUser({required UserDto user}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = CreateUserRequest()
      ..name = user.name
      ..email = user.email
      ..profilePicUrl = user.profilePicLink
      ..password = user.password
      ..dateCreated = user.registrationDate;
    var response = await stub.createUser(request);
    print(response);
    return UserDto(
      userId: response.id,
      name: response.name, 
      email: response.email, 
      password: response.password, 
      registrationDate: response.dateCreated, 
      profilePicLink: response.profilePicUrl, 
      updatedDate: response.dateCreated);
  }
}

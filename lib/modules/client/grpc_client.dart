import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';

import '../../ui/widgets/registration_page/models/new_user_model.dart';
import 'package:grpc/grpc.dart';

import '../../src/generated/users/users.pbgrpc.dart';
import '../sending_manager/library/library_sending_manager.dart';
import '../../domain/data/dto/user_dto/user_dto.dart';
import '../../src/generated/grpc_lib/grpc_user_lib.dart';
import 'custom_exception.dart';

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('localhost',
            port: 6000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
  Stream<ConnectionState> get channelState => _channel.onConnectionStateChanged;

  Future deleteUser({required int userId}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
    var request = DeleteUserRequest()..id = userId;
    var response = await stub.deleteUser(request);
    try {
      response = await stub.deleteUser(request);
    } catch (e) {
      print(e);
    }
    print('User delete: $response');
    return response;
  }

  Future<GetUserResponse> getUser({required int userId}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
    var request = GetUserRequest()..id = userId;
    GetUserResponse response = GetUserResponse();
    try {
      response = await stub.getUser(request);
    } on GrpcError catch (e) {
      print('ERROR getUser GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response;
  }

  Future createUser({required NewUserModel user}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = CreateUserRequest()
      ..name = user.name!
      ..email = user.email!
      ..profilePicUrl = user.profilePicLink
      ..password = user.password!
      ..dateCreated = user.registrationDate;
    var response = CreateUserResponse();
    try {
      response = await stub.createUser(request);
    } catch (e) {
      print(e);
    }
    print('CREATE USER FROM GRPC CLIENT RESPONSE: ${response.toString()}');
    return UserDto(
        userId: response.id,
        name: response.name,
        email: response.email,
        createdDate: response.dateCreated,
        profilePicLink: response.profilePicUrl,
        updatedDate: response.dateCreated);
  }

  updateUser({required UserDto updatedUser}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = UpdateUserRequest()
      ..id = updatedUser.userId!
      ..email = updatedUser.email
      ..name = updatedUser.name
      ..profilePicUrl = updatedUser.profilePicLink;
    var response = UpdateUserResponse();
    print("?????????????????? ????????: $request");
    try {
      response = await stub.updateUser(request);
    } catch (e) {
      print(e);
    }
    print("?????????????? ????????????c: $response");
    return response;
  }
}

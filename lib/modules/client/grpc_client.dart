import 'package:chat_app/ui/widgets/registration_page/models/new_user_model.dart';
import 'package:grpc/grpc.dart';

import '../../src/generated/users/users.pbgrpc.dart';
import '../../domain/data/dto/user_dto/user_dto.dart';
import '../../src/generated/grpc_lib/grpc_user_lib.dart';

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('localhost',
            port: 5000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
  Stream<ConnectionState> get channelState => _channel.onConnectionStateChanged;

  Future deleteUser({required int userId}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = DeleteUserRequest()..id = userId;
    var response = await stub.deleteUser(request);
    print('User delete: $response');
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
    var response = await stub.createUser(request);
    print(response);
    return UserDto(
        userId: response.id,
        name: response.name,
        email: response.email,
        createdDate: response.dateCreated,
        profilePicLink: response.profilePicUrl,
        updatedDate: response.dateCreated);
  }
}

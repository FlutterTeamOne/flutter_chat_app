import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/client/users_client.dart';

import '../../domain/data/dto/user_dto/user_dto.dart';

Future<void> main() async {
  final _channel = GrpcClient().channel;

  UserClient().getUser(id: 1);
  var user = UserDto(
      name: 'name',
      email: 'email',
      password: 'pass',
      registrationDate: '2022-12-02T21:36:32.653712',
      profilePicLink: 'profilePicLinkasdfasdf',
      updatedDate: 'updatedDate');

  UserClient().createUser(user: user);
}
import 'package:chat_app/domain/data/library/library_data.dart';

class UserDto extends ModelDto {

  final int localUserId;
  final String name;
  final String email;
  final String registrationDate;
  final String profilePicLink;
  final int mainUsersId;

  UserDto({
    required this.localUserId,
    required this.name,
    required this.email,
    required this.registrationDate,
    required this.profilePicLink,
    required this.mainUsersId,
  });


}
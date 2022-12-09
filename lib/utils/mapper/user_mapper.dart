//
// import 'package:chat_app/domain/data/library/library_data.dart';
// import 'package:chat_app/domain/entities/library/library_entities.dart';
// import 'package:chat_app/utils/library/library_utils.dart';
//
// class UserMapper {
//   UserDto toUserDto(User entity) {
//     try {
//       return UserDto(
//         id: entity.id,
//         name: entity.name,
//         email: entity.email,
//         registrationDate: entity.registrationDate,
//         profilePicLink: entity.profilePicLink,
//         mainUsersId: entity.mainUsersId
//       );
//     } catch (e) {
//       throw MapperException<User, UserDto>(e.toString());
//     }
//   }
//
//   List<UserDto> toUserDtoList(List<User> entities) {
//     final List<UserDto> users = [];
//
//     for (final entity in entities) {
//       users.add(toUserDto(entity));
//     }
//
//     return users;
//   }
//
//   UserDto toUserDtoFromDb(UserDbEntity entity) {
//     try {
//       return UserDto(
//           id: entity.id,
//           name: entity.name,
//           email: entity.email,
//           registrationDate: entity.registrationDate,
//           profilePicLink: entity.profilePicLink,
//           mainUsersId: entity.mainUsersId
//       );
//     } catch (e) {
//       throw MapperException<UserDbEntity, User>(e.toString());
//     }
//   }
//
//   List<UserDto> toUserDtoListFromDb(List<UserDbEntity> entities) {
//     final List<UserDto> users = [];
//
//     for (final entity in entities) {
//       users.add(toUserDtoFromDb(entity));
//     }
//
//     return users;
//   }
//
//   UserDbEntity toUserDbEntity(UserDto user) {
//     try {
//       return UserDbEntity(
//           id: user.id,
//           name: user.name,
//           email: user.email,
//           registrationDate: user.registrationDate,
//           profilePicLink: user.profilePicLink,
//           mainUsersId: user.mainUsersId
//       );
//     } catch (e) {
//       throw MapperException<UserDto, UserDbEntity>(e.toString());
//     }
//   }
//
//   List<UserDbEntity> toUserDbListEntity(List<UserDto  > entities) {
//     final List<UserDbEntity> list = [];
//
//     for (final entity in entities) {
//       list.add(toUserDbEntity(entity));
//     }
//
//     return list;
//   }
// }
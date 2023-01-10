// part of 'user_bloc.dart';

// abstract class UserEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CreateUserEvent extends UserEvent {
//   final UserDto user;

//   CreateUserEvent({
//     required this.user,
//   });
//   @override
//   List<Object?> get props => [user];
// }

// class ReadUsersEvent extends UserEvent {
//   final List<UserDto>? users;
//   final bool userDb;

//   ReadUsersEvent({this.users, this.userDb = true});
//   @override
//   List<Object?> get props => [users, userDb];
// }

// class ChangeUserEvent extends UserEvent {
//   final UserDto? user;
//   final bool isStartDB;

//   ChangeUserEvent({this.user, this.isStartDB = true});
//   @override
//   List<Object?> get props => [user, isStartDB];
// }

// class UpdateUserEvent extends UserEvent {
//   final UserDto? user;

//   UpdateUserEvent({this.user});
//   @override
//   List<Object?> get props => [user];
// }

// class DeleteUserEvent extends UserEvent {
//   final int? userId;
//   // final String? deleteUserTime;
//   DeleteUserEvent({required this.userId});
//   @override
//   List<Object?> get props => [userId];
// }

// import 'dart:async';
// import '../../../client/grpc_client.dart';
// import '../../service_locator/locator.dart';
// import '../../../storage_manager/db_helper/user_path.dart';
// import '../../../../src/constants/db_constants.dart';
// import '../../../../src/generated/grpc_lib/grpc_message_lib.dart';
// import '../../../../src/generated/grpc_lib/grpc_user_lib.dart';
// import 'package:equatable/equatable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../domain/data/library/library_data.dart';
// import '../../../../src/generated/grpc_lib/grpc_sync_lib.dart';
// import '../../../../src/libraries/library_all.dart';
// import '../../../sending_manager/library/library_sending_manager.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   late LocalUsersServices _usersServices;
//   late LocalChatServices _chatServices;
//   late LocalMessagesServices _messagesServices;
//   late MainUserServices _mainUserServices;
//   late StreamSubscription _subscription;
//   // final GrpcClient grpcClient;

//   UserBloc() : super(const UserState()) {
//     _usersServices = LocalUsersServices();
//     _mainUserServices = MainUserServices();
//     _messagesServices = LocalMessagesServices();
//     _chatServices = LocalChatServices();
//     DBHelper.instanse.updateListenController.stream.listen((event) async {
//       if (event == true) {
//         var users = await _usersServices.getAllUsers();
//         print('sort message:$users');
//         add(ReadUsersEvent(users: users));
//         // state.copyWith(messages: messages);
//       }
//     });
//     on<ReadUsersEvent>(_onReadUsersEvent);
//     on<CreateUserEvent>(_onCreateUserEvent);
//     on<ChangeUserEvent>(_onChangeUserEvent);
//     on<UpdateUserEvent>(_onUpdateUserEvent);
//     on<DeleteUserEvent>(_onDeleleUserEvent);
//   }

//   FutureOr<void> _onReadUsersEvent(
//       ReadUsersEvent event, Emitter<UserState> emit) async {
//     //???????????????? ???????? ???????????? ???? ?????????????????? ????????
//     var users = <UserDto>[];
//     //?????????????????? ?????????????????? ???????????????????????? ????????????????????????
//     if (state.userDbthis) {
//       List<Map<String, Object?>> usersForUpdate =
//           await _usersServices.getAllUserIdAndUpdatedStarted();
//       List<UserRequest> usersRequest = [];
//       if (usersForUpdate.isNotEmpty) {
//         print("lastID ${usersForUpdate.last['user_id']}");
//         for (var user in usersForUpdate) {
//           usersRequest.add(UserRequest(
//               userId: user['user_id'] as int,
//               updatedDate: user['updated_date'] as String));
//         }
//       }
//       //???????????????????????? ?? ??????????????
//       var stub = GrpcSynchronizationClient(GrpcClient().channel);
//       var usersResponse = UsersResponse();
//       //???????????????????? ???????????? ???? ???????????? ?? ???????????????? ???????? ????????????
//       try {
//         usersResponse = await stub.sync(UsersRequest(users: usersRequest));
//       } catch (e) {
//         print(e);
//       }
//       print("UsersServ $usersResponse");
//       for (var user in usersResponse.usersNew) {
//         //???????????? ???????? ???????????? ?? ???????????????????? ???? ?? ?????????????????? ????
//         await _usersServices.createUserStart(
//             userId: user.userId,
//             name: user.name,
//             email: user.email,
//             createdDate: user.createdDate,
//             updatedDate: user.updateDate,
//             deletedDate: user.deletedDate,
//             profilePicUrl: user.picture);
//       }
//       for (var user in usersResponse.usersUpdated) {
//         await _usersServices.updateUserStart(
//             newValues: '''name = "${user.name}",
//                           email = "${user.email}",
//                           created_date = "${user.createdDate}",
//                           updated_date = "${user.updateDate}",
//                           deleted_date = "${user.deletedDate}",
//                           profile_pic_link = "${user.picture}"''',
//             condition: 'user_id = ${user.userId}');
//       }
// //???????????????? ???????? ?????????????????? ????????????
//       users = await _usersServices.getAllUsersStart();
//     } else {
// //???????????? ??????????????????????????
//       var maxChatId = await _chatServices.getMaxId();
//       var maxMessageId = await _messagesServices.getMaxMessageId();
//       var maxUserId = await _usersServices.getMaxUserId();
//       var stub = GrpcSynchronizationClient(GrpcClient().channel);
//       //?????????? ?????? ???????????????????? ????????????
//       var usersUp = await _usersServices.getAllUserIdAndUpdated();
//       var usersRequestA = <UserRequest>[];
//       if (usersUp.isNotEmpty) {
//         print("lastID ${usersUp.last['user_id']}");
//         for (var user in usersUp) {
//           usersRequestA.add(UserRequest(
//               userId: user['user_id'] as int,
//               updatedDate: user['updated_date'] as String));
//         }
//       }
//       //???????????? ???? ????????????
//       var response = DataDBResponse();
//       try {
//         response = await stub.getUsersSynh(SynhMainUser(
//             mainUserId: maxUserId,
//             chatId: maxChatId,
//             messageId: maxMessageId,
//             users: UsersRequest(users: usersRequestA)));
//       } catch (e) {
//         print(e);
//       }
//       print("NEWUSERS: ${response.newUsers}");
//       //???????????????????? ?????????? ???????????? ?????? ?????????? ??????????
//       for (var user in response.newUsers) {
//         print(
//             "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isNotEmpty}");
//         if (user.deletedDate.isNotEmpty) {
//           const String deletedUserAvatar =
//               """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
//           await _usersServices.createUser(
//               name: user.name,
//               email: user.email,
//               createdDate: user.createdDate,
//               updatedDate: user.updateDate,
//               deletedDate: user.deletedDate,
//               profilePicUrl: deletedUserAvatar,
//               userId: user.userId);
//         } else
//         //???????????? ???????? ???????????? ?? ???????????????????? ???? ?? ?????????????????? ????
//         {
//           await _usersServices.createUser(
//               name: user.name,
//               email: user.email,
//               createdDate: user.createdDate,
//               updatedDate: user.updateDate,
//               deletedDate: user.deletedDate,
//               profilePicUrl: user.picture,
//               userId: user.userId);
//         }
//       }
//       print('RESPONSE_CHATS: ${response.chats}');
//       for (var chat in response.chats) {
//         print('USER BLOC CHAT: $chat');
//         await _chatServices.createChat(
//             createDate: chat.createdDate,
//             userId: chat.userId,
//             chatId: chat.chatId);
//       }
//       print('REPSONSE_UPDATEUSERS: ${response.updatedUsers}');
//       for (var user in response.updatedUsers) {
//         print(
//             "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isEmpty}");
//         if (user.deletedDate.isNotEmpty) {
//           const String deletedUserAvatar =
//               """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
//           await _usersServices.updateUser(
//               newValues: '''name = "${user.name}",
//                           email = "${user.email}",
//                           created_date = "${user.createdDate}",
//                           updated_date = "${user.updateDate}",
//                           deleted_date = "${user.deletedDate}",
//                           profile_pic_link = "$deletedUserAvatar"''',
//               condition: 'user_id = ${user.userId}');
//         } else
//         //???????????? ???????? ???????????? ?? ???????????????????? ???? ?? ?????????????????? ????
//         {
//           await _usersServices.updateUser(
//               newValues: '''name = "${user.name}",
//                           email = "${user.email}",
//                           created_date = "${user.createdDate}",
//                           updated_date = "${user.updateDate}",
//                           deleted_date = "${user.deletedDate}",
//                           profile_pic_link = "${user.picture}"''',
//               condition: 'user_id = ${user.userId}');
//         }
//       }
//       for (var message in response.messages) {
//         var type = ContentType.isText.name == message.contentType.name
//             ? ContentType.isText
//             : ContentType.isMedia.name == message.contentType.name
//                 ? ContentType.isMedia
//                 : ContentType.isMediaText.name == message.contentType.name
//                     ? ContentType.isMediaText
//                     : ContentType.isText;
//         var msg = Message(
//           messageId: message.messageId,
//           chatId: message.chatId,
//           senderId: message.senderId,
//           content: message.content,
//           dateCreate: message.createdDate,
//           dateUpdate: message.updatedDate,
//           dateDelete: message.deletedDate,
//           contentType: type,
//           attachmentId: message.attachmentId,
//           isRead: message.isRead,
//         );
//         await _messagesServices.addNewMessageFromBase(message: msg);
//       }

//       users = await _usersServices.getAllUsers();
//     }
//     for (var userServ in users) {
//       print('USERS BLOCK: $userServ');
//     }
//     //?????????????????? ???????? ???????????? ?? state
//     emit(state.copyWith(users: users));

//     // emit(state.copyWith(users: event.users));
//     // print(event.users);
//     // }
//   }

//   FutureOr<void> _onCreateUserEvent(
//       CreateUserEvent event, Emitter<UserState> emit) async {
//     //?????????????????? ???????????? ?????????? ???? ?????????? ???????????????? ???? ????????????
//     var user = event.user;
//     //???????????????????? ???????????? ???? ???????????????? ?????????? ???? ????????????
// //?????????? ?????????????????? ???????????????? ?????????? ???? ??????????????
//     //?????????????? ?????????? ???? ?????????????????? ????

//     await _usersServices.createUser(
//       userId: user.userId!,
//       name: user.name,
//       email: user.email,
//       createdDate: user.createdDate,
//       updatedDate: user.updatedDate,
//       profilePicUrl: user.profilePicLink,
//     );
// //?????????????????? ?? main_user table main_id, date_sync and key

//     // var stub = await GrpcUsersClient(Locator.getIt<GrpcClient>().channel)
//     //     .createUser(user.mainUsersId);
//   }

//   FutureOr<void> _onChangeUserEvent(
//       ChangeUserEvent event, Emitter<UserState> emit) {
//     print('GET USER PREF: ${UserPref.getUserDbPref} ');
//     UserPref.setUserDbPref = event.isStartDB;
//   }

//   FutureOr<void> _onDeleleUserEvent(
//       DeleteUserEvent event, Emitter<UserState> emit) async {
//     var result;
//     try {
//       result = await GrpcClient().deleteUser(userId: event.userId!);
//     } catch (e) {
//       print(e);
//     }
//     print('event: ${event.userId}');
//     print(result.isDeleted);
//     emit(state.copyWith(isDeleted: result.isDeleted));
//   }

//   FutureOr<void> _onUpdateUserEvent(
//       UpdateUserEvent event, Emitter<UserState> emit) async {
//     UserDto? user = event.user;
//     var result = UpdateUserResponse();
//     try {
//       result = await GrpcClient().updateUser(updatedUser: user!);
//       print('RESULT: $result');
//     } catch (e) {
//       print(e);
//     }
//     await _usersServices.updateUser(
//         newValues: '''${DatabaseConst.usersColumnName} = "${result.name}",
//             ${DatabaseConst.usersColumnEmail} = "${result.email}",
//             ${DatabaseConst.usersColumnProfilePicLink} = "${result.profilePicUrl}",
//             ${DatabaseConst.usersColumnUpdatedDate} = "${result.dateUpdated}"''',
//         condition: '${DatabaseConst.usersColumnUserId} = ${result.userId}');
//     var users = await _usersServices.getAllUsers();
//     emit(state.copyWith(users: users));
//   }
// }

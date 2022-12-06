import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

import '../../client/grpc_client.dart';
import '../../features/data/models/user_model.dart/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late LocalUsersServices _usersServices;
  late StreamSubscription _subscription;
  // final GrpcClient grpcClient;
  UserBloc() : super(UserState()) {
    on<ReadUsersEvent>(_onReadUsersEvent);
    on<CreateUserEvent>(_onCreateUserEvent);
  }

  FutureOr<void> _onReadUsersEvent(
      ReadUsersEvent event, Emitter<UserState> emit) async {
    if (event.users != null) {
      var users = await _usersServices.getAllUsers();
      print('USERS: $users');
      emit(state.copyWith(users: users));
    } else {
      emit(state.copyWith(users: event.users));
      print(event.users);
    }
  }

  FutureOr<void> _onCreateUserEvent(
      CreateUserEvent event, Emitter<UserState> emit)async {
    var user = event.user;
   await _usersServices.createUser(
        name: user.name,
        email: user.email,
        registrationDate: user.registrationDate,
        profilePicUrl: user.profilePicLink,
        mainUserId: user.mainUsersId);
  }
}

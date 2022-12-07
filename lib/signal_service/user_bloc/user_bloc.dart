import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/lib_db.dart';

import '../../src/libs/models_lib.dart';

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
    _usersServices = LocalUsersServices();
    var users = await _usersServices.getAllUsers();
    print('USERS: $users');
    emit(state.copyWith(users: users));

    // emit(state.copyWith(users: event.users));
    // print(event.users);
    // }
  }

  FutureOr<void> _onCreateUserEvent(
      CreateUserEvent event, Emitter<UserState> emit) async {
    var user = event.user;
    await _usersServices.createUser(
        name: user.name,
        email: user.email,
        registrationDate: user.registrationDate,
        profilePicUrl: user.profilePicLink,
        mainUserId: user.mainUsersId);
  }
}

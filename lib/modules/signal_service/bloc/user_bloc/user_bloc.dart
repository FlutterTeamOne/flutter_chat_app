import 'dart:async';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/signal_service/service_locator/locator.dart';
import 'package:chat_app/src/generated/users/users.pbgrpc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/data/library/library_data.dart';
import '../../../sending_manager/library/library_sending_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late LocalUsersServices _usersServices;
  late StreamSubscription _subscription;
  // final GrpcClient grpcClient;
  UserBloc() : super(const UserState()) {
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
    var stub = GrpcUsersClient(Locator.getIt<GrpcClient>().channel)
        .createUser(request);
  }
}

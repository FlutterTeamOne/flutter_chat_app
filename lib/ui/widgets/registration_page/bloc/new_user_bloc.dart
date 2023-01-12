// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import '../../../../domain/data/dto/user_dto/user_dto.dart';
import '../../../../modules/client/grpc_client.dart';

import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc()
      : super(NewUserState(
            newUser: UserDto(
                name: '',
                email: "",
                updatedDate: "",
                createdDate: "",
                profilePicLink: ''))) {
    on<SetNewUserEvent>(_setNewUserEvent);
  }

  void _setNewUserEvent(
      SetNewUserEvent event, Emitter<NewUserState> emit) async {
    // await DBHelper.instanse.initDB(user: event.user);
    /// TODO refactor print
    print('event user ${event.user.name}');
    UserDto newCreatedUser = await GrpcClient().createUser(user: event.user);

    /// TODO refactor print
    print('response: $newCreatedUser');
    emit(state.copyWith(newUser: newCreatedUser));
  }
}

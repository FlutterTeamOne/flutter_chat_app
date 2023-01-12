// ignore_for_file: depend_on_referenced_packages

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
    UserDto newCreatedUser = await GrpcClient().createUser(user: event.user);

    emit(state.copyWith(newUser: newCreatedUser));
  }
}

import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';

import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc()
      : super(NewUserState(
            newUser: UserDto(
                name: "1",
                email: "1",
                password: "1",
                updatedDate: "1",
                registrationDate: "1",
                profilePicLink: '1'))) {
    on<SetNewUserEvent>(_setNewUserEvent);
  }

  void _setNewUserEvent(
      SetNewUserEvent event, Emitter<NewUserState> emit) async {
    emit(NewUserState(newUser: event.user));
  }
}

import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewUserNotifier extends StateNotifier<NewUserState> {
  NewUserNotifier()
      : super(NewUserState(
            newUser: UserDto(
                name: '',
                email: "",
                updatedDate: "",
                createdDate: "",
                profilePicLink: '')))
  if 
  void _setNewUserEvent(
      SetNewUserEvent event, Emitter<NewUserState> emit) async {
    // await DBHelper.instanse.initDB(user: event.user);
    print('event user ${event.user.name}');
    UserDto newCreatedUser = await GrpcClient().createUser(user: event.user);
    print('response: $newCreatedUser');
    emit(state.copyWith(newUser: newCreatedUser));
  }
}
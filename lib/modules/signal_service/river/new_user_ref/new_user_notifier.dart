import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/signal_service/river/new_user_ref/new_user_state.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_state.dart';
import 'package:chat_app/ui/widgets/registration_page/models/new_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewUserNotifier extends StateNotifier<NewUserStateRef> {
  NewUserNotifier()
      : super(NewUserStateRef(
            newUser: UserDto(
                name: 'qwerqwer',
                email: "",
                updatedDate: "",
                createdDate: "",
                profilePicLink: '')));

  Future<void> newUser({required NewUserModel newUser}) async {
    print('event user ${state.newUser.name}');
    UserDto newCreatedUser = await GrpcClient().createUser(user: newUser);
    print('response: $newCreatedUser');
    NewUserStateRef _newState = NewUserStateRef(newUser: newCreatedUser);
    print ('var newState: $_newState');
    state = _newState;

    print ('state - create new user: $state');
  }
}
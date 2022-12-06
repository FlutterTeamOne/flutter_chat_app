import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../features/data/models/user_model.dart/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';

import 'new_user_event.dart';
import 'new_user_state.dart';

class New_userBloc extends Bloc<New_userEvent, New_userState> {
  New_userBloc() : super(New_userState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<New_userState> emit) async {
    emit(state.clone());
  }
}

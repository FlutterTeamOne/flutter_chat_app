import 'package:bloc/bloc.dart';

import 'unread_messages_event.dart';
import 'unread_messages_state.dart';

class Unread_messagesBloc extends Bloc<Unread_messagesEvent, Unread_messagesState> {
  Unread_messagesBloc() : super(Unread_messagesState().init());

  @override
  Stream<Unread_messagesState> mapEventToState(Unread_messagesEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<Unread_messagesState> init() async {
    return state.clone();
  }
}

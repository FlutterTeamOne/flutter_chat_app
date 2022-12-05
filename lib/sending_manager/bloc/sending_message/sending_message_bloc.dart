import 'dart:async';

import 'package:bloc/bloc.dart';


import 'sending_message_event.dart';
import 'sending_message_state.dart';
import 'package:flutter_chat_app/sending_manager/connection_bloc/connection_bloc.dart';

class SendingMessageBloc
    extends Bloc<SendingMessageEvent, SendingMessageState> {
  late ConnectionBloc connectionBloc;

  SendingMessageBloc() : super(SendingMessageState()) {
    on<NewMessageEvent>(_onNewMessageEvent);
  }

  FutureOr<void> _onNewMessageEvent(
      NewMessageEvent event, Emitter<SendingMessageState> emit) {
    connectionBloc.stream.listen((connect) {
      if (connect is ActiveConnectionState && event.message != null) {
        // emit(state.message);
      }
    });
  }
}

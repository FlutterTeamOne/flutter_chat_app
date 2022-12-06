import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/features/data/models/message_id_in_main_model/message_id_in_main_model.dart';

import '../../service/lib_db.dart';

part 'message_id_in_main_event.dart';
part 'message_id_in_main_state.dart';

class MessageIdInMainBloc
    extends Bloc<MessageIdInMainEvent, MessageIdInMainState> {
  late MessageIdServices _messageIdServices;
  MessageIdInMainBloc() : super(MessageIdInMainState()) {
    on<CreateMessageIdInMainEvent>(_onCreateMessageIdInMainEvent);
  }

  FutureOr<void> _onCreateMessageIdInMainEvent(CreateMessageIdInMainEvent event,
      Emitter<MessageIdInMainState> emit) async {
    var messageId = event.messageIdInMain;
  await  _messageIdServices.createMessageId(
        mainId: messageId.mainMessageId, localId: messageId.localMessageId);
  }
}

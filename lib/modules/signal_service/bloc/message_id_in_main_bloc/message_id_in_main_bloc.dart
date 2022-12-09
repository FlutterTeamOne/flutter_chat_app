import 'dart:async';

import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    await _messageIdServices.createMessageId(
        mainId: messageId.mainMessageId, localId: messageId.localMessageId);
  }
}

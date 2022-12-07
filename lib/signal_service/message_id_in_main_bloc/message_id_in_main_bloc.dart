import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/lib_db.dart';
import '../../src/libs/models_lib.dart';

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

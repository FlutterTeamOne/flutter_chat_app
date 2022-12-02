import 'package:bloc/bloc.dart';
import 'package:flutter_chat_app/storage_manager/last_unread_message.dart';



import 'unread_message_event.dart';
import 'unread_message_state.dart';

class UnreadMessageBloc extends Bloc<UnreadMessageEvent, UnreadMessageState> {
  UnreadMessageBloc() : super(UnreadMessageState()) {
    on<SetUnreadEvent>((event, emit) async {
      await UnreadMessage().setUnreadMessage(event.messageId, event.friendsChatId, event.isRead);
      emit(state.copyWith());
    });
  }
}

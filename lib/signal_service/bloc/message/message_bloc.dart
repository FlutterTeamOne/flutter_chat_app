// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter_chat_app/domain/model/user.dart';
// import 'package:flutter_chat_app/library.dart';

// part 'message_bloc.freezed.dart';

// part 'message_event.dart';
// part 'message_state.dart';

// class MessageBloc extends Bloc<MessageEvent, MessageState> {
//   final IMessagesServices messagesServices;
//   StreamSubscription? _subsribtion;

//   MessageBloc({required this.messagesServices})
//       : super(const MessageState.initial()) {
//     on<_MessageEventSent>(_messageEvent);
//   }

//   void _messageEvent(
//     _MessageEventSent event,
//     Emitter<MessageState> emit,
//   ) async {
//     await _subsribtion?.cancel();
    
//     _subsribtion = messagesServices.addNewMessage(friendsChatId: 1, senderId: 1, content: event.message.content, date: DateTime.now().toIso8601String());
//   }
// }

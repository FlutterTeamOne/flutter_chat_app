import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

import '../../features/data/models/chat_model/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late LocalChatServices _chatServices;
  ChatBloc() : super(ChatState()) {
    on<ReadChatEvent>(_onReadChatEvent);
    on<CreateChatEvent>(_onCreateChatEvent);
  }

  FutureOr<void> _onReadChatEvent(
      ReadChatEvent event, Emitter<ChatState> emit) async {
    if (event.chats != null) {
      var chats = await _chatServices.getAllChats();
      print('IF CHATS NULL - ADD CHATS FROM LOCAL DB: $chats');
      emit(state.copyWith(chats: chats));
    } else {
      emit(state.copyWith(chats: event.chats));
      print('ADD CHAT FROM EVENT: ${event.chats}');
    }
  }

  FutureOr<void> _onCreateChatEvent(
      CreateChatEvent event, Emitter<ChatState> emit) async {
    var chat = event.chat;
    await _chatServices.createChat(
        chatIdMainDB: chat.chatIdMain, friendId: chat.friendId);
  }
}

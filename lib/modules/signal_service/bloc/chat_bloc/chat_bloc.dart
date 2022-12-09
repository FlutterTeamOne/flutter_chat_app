import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/signal_service/library/library_signal_service.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late LocalChatServices _chatServices;
  UserBloc userBloc;
  ChatBloc({required this.userBloc}) : super(ChatState(chatId: null)) {
    on<ReadChatEvent>(_onReadChatEvent);
    on<CreateChatEvent>(_onCreateChatEvent);
    on<GetChatIdEvent>(_onGetChatIdEvent);
  }

  FutureOr<void> _onReadChatEvent(
      ReadChatEvent event, Emitter<ChatState> emit) async {
    // userBloc.stream.listen((usersItem) {
    //   var localUserId = usersItem.users?.;
    //   event.chats![localUserId!].localChatId;
    // });
    if (event.chats == null) {
      _chatServices = LocalChatServices();
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
    _chatServices = LocalChatServices();
    var chat = event.chat;
    var chats = await _chatServices.createChat(
        chatIdMainDB: chat.chatIdMain, friendId: chat.friendId);
    emit(state.copyWith(chats: chats));
  }

  FutureOr<void> _onGetChatIdEvent(
      GetChatIdEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatId: event.chatId, localChatId: event.localChatId));
  }
}

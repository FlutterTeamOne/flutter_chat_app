import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/data/library/library_data.dart';
import '../../../sending_manager/library/library_sending_manager.dart';
import '../../library/library_signal_service.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late LocalChatServices _chatServices;
  UserBloc userBloc;
  ChatBloc({required this.userBloc}) : super(const ChatState()) {
    on<ReadChatEvent>(_onReadChatEvent);
    on<CreateChatEvent>(_onCreateChatEvent);
    on<GetChatIdEvent>(_onGetChatIdEvent);
    on<DeleteChatEvent>(_onDeleteChatEvent);
    on<EditChatEvent>(_onEditChatEvent);
  }

  FutureOr<void> _onReadChatEvent(
      ReadChatEvent event, Emitter<ChatState> emit) async {
    // userBloc.stream.listen((usersItem) {
    //   var localUserId = usersItem.users?.;
    //   event.chats![localUserId!].localChatId;
    // });
    // if (event.chats == null) {
      _chatServices = LocalChatServices();
      var chats = await _chatServices.getAllChatsSortedByUpdatedDate();
      print('IF CHATS NULL - ADD CHATS FROM LOCAL DB: $chats');
      emit(state.copyWith(chats: chats));
    // } else {
    //   emit(state.copyWith(chats: event.chats));
    //   print('ADD CHAT FROM EVENT: ${event.chats}');
    // }
  }

  FutureOr<void> _onCreateChatEvent(
      CreateChatEvent event, Emitter<ChatState> emit) async {
    _chatServices = LocalChatServices();
    var chat = event.chat;
    var chats = await _chatServices.createChat(
        chatId: chat.chatId,
        createDate: chat.createdDate,
        userId: chat.userIdChat);
    emit(state.copyWith(chats: chats));
  }

  FutureOr<void> _onGetChatIdEvent(
      GetChatIdEvent event, Emitter<ChatState> emit) async {
    print('HEY');
    emit(state.copyWith(chatId: event.chatId));
  }

  FutureOr<void> _onDeleteChatEvent(
      DeleteChatEvent event, Emitter<ChatState> emit) async {
    //TODO: func delete chat
    await _chatServices.deleteChat(id: event.chatId);
    print('CHAT ID: ${event.chatId}');
  }

  FutureOr<void> _onEditChatEvent(
      EditChatEvent event, Emitter<ChatState> emit) async {
    //TODO: func edit chat
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}

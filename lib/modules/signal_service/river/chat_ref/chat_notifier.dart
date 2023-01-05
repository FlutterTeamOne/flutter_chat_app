import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/client/rest_client.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../sending_manager/library/library_sending_manager.dart';

class ChatNotifier extends StateNotifier<ChatStateRef> {
  late LocalChatServices _chatServices;
  ChatNotifier() : super(const ChatStateRef()) {
    _chatServices = LocalChatServices();
    DBHelper.instanse.updateListenController.stream.listen((event) {
      if (event) {
        readChat();
      }
    });
  }

  Future<ChatStateRef> readChat([List<ChatDto>? chats]) async {
    //TODO: Поменять getAllChats на сортированную выборку getAllChatsSortedByUpdatedDate()
    var chats = await _chatServices.getAllChatsSortedByUpdatedDate();
    //
    var restChats = await RestClient().getChats();
    print('IF CHATS is NULL - ADD CHAT FROM LOCAL DB: $restChats');
    print('IF CHATS is NULL - ADD CHAT FROM LOCAL DB: $chats');
    //сравниваем два листа и в зависимости от этого меняем стейт на нужный лист
    listEquals(chats, restChats)
        ? state = state.copyWith(chats: restChats)
        : state = state.copyWith(chats: chats);

    //если локальная база отличается от серверной,
    //то перезаписываем локальную базу
    if (!listEquals(chats, restChats)) {
      for (var chat in restChats) {
        await _chatServices.createChat(
            createDate: chat.createdDate,
            userId: chat.userIdChat,
            chatId: chat.chatId!);
      }
    } else {
      print('ADD CHAT FROM EVENT: $chats');
      state = state.copyWith(chats: chats);
    }
    return state;
  }

  createChat(ChatDto chat) async {
    ChatDto chatFromRest;
    try {
      chatFromRest = await RestClient().createChatRest(
          creatorUserId: UserPref.getUserId,
          user2Id: chat.userIdChat,
          date: chat.createdDate);
    } on DioError catch (e) {
      throw CustomException(e.response.toString());
    }

    print("JAJAJ");
    var chats = await _chatServices.createChat(
        createDate: chatFromRest.createdDate,
        userId: chatFromRest.userIdChat,
        chatId: chatFromRest.chatId!);
    //TODO:запрос к restApi на создание чата
    state = state.copyWith(chats: chats);
  }

  void getChatId(int chatId) {
    print('HEY');
    state = state.copyWith(chatId: chatId);
    // return state;
  }

  deleteChat(int chatId) async {
    //TODO: func delete chat
    await _chatServices.deleteChat(id: chatId);
    //запрос на удаление к рест серверу
    await RestClient().deleteChatRest(id: chatId);
    print('CHAT ID: $chatId');
    state = state.copyWith(chatId: null);
  }
}
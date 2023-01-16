import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/client/rest_client.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../sending_manager/library/library_sending_manager.dart';

class ChatNotifier extends StateNotifier<ChatStateRef> {
  late LocalChatServices _chatServices;
  ChatNotifier() : super(const ChatStateRef()) {
    _chatServices = LocalChatServices();
    DBHelper.instanse.updateListenController.stream.listen((event) {
      if (event == DbListener.isChat) {
        if (!mounted) return;
        readChat();
      }
    });
  }

  Future<ChatStateRef> readChat([List<ChatDto>? chats]) async {
    List<ChatDto> chats = [];

    chats = await _chatServices.getAllChatsSortedByUpdatedDate();

    print('ADD CHAT FROM EVENT: $chats');
    state = state.copyWith(chats: chats);

    return state;
  }

  Future<int> createChat(ChatDto chat) async {
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
    List<ChatDto> chats = await _chatServices.createChat(
        createDate: chatFromRest.createdDate,
        userId: chatFromRest.userIdChat,
        chatId: chatFromRest.chatId!);
    //TODO:запрос к restApi на создание чата
    state = state.copyWith(chats: chats);
    return chatFromRest.chatId!;
  }

  void getChatId(int chatId) {
    print('HEY');
    state = state.copyWith(chatId: chatId);
    // return state;
  }

  Future<void> deleteChat(int chatId) async {
    //запрос на удаление к рест серверу
    dynamic data;
    // int friendId = await LocalChatServices().getUserIdByChatId(id: chatId);
    try {
      //TODO: Добавлять всем сообщениям этого чата deleted_date в локалке
      data = await RestClient().deleteChatRest(id: chatId);
    } on DioError catch (e) {
      print("DioError DeleteChatNotifer ${e.response.toString()}");
      throw CustomException(e.response.toString());
    } catch (e) {
      print("DeleteChatNotifer $e");
      throw CustomException(e.toString());
    }
    if (data == null) {
      print("DATA == NULL DeleteChatNotifer");
      throw CustomException("RestServer not found");
    }
    print('CHAT ID: $chatId');
    // await LocalChatServices().deleteChat(id: chatId);
    // await LocalMessagesServices().deleteAllMessagesInChat(chatID: chatId);
    // await LocalUsersServices().deleteUser(id: friendId);
    state = state.copyWith(chatId: null);
  }
}

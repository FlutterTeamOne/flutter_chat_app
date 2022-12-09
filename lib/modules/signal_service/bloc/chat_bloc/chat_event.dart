part of 'chat_bloc.dart';

abstract class ChatEvent {}

class CreateChatEvent extends ChatEvent {
  final ChatDto chat;

  CreateChatEvent({
    required this.chat,
  });
}

class ReadChatEvent extends ChatEvent {
  final List<ChatDto>? chats;

  ReadChatEvent({this.chats});
}

class GetChatIdEvent extends ChatEvent {
  final int chatId;
  final int localChatId;
  GetChatIdEvent(this.chatId, this.localChatId);
}

class DeleteChatEvent extends ChatEvent {
  final int chatId;

  DeleteChatEvent(this.chatId);
}

class EditChatEvent extends ChatEvent {}

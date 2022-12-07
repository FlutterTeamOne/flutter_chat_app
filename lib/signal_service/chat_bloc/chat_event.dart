part of 'chat_bloc.dart';

abstract class ChatEvent  {}
class CreateChatEvent extends ChatEvent {
  final ChatModel chat;
 
  CreateChatEvent({
    required this.chat,
   
  });
}

class ReadChatEvent extends ChatEvent {
  final List<ChatModel>? chats;

  ReadChatEvent({this.chats});
}
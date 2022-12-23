part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateChatEvent extends ChatEvent {
  final ChatDto chat;

  CreateChatEvent({
    required this.chat,
  });
  @override
  List<Object?> get props => [chat];
}

class ReadChatEvent extends ChatEvent {
  final List<ChatDto>? chats;

  ReadChatEvent({this.chats});
  @override
  List<Object?> get props => [chats];
}

class GetChatIdEvent extends ChatEvent {
  final int chatId;
  GetChatIdEvent(this.chatId);
  @override
  List<Object?> get props => [chatId];
}

class DeleteChatEvent extends ChatEvent {
  final int chatId;

  DeleteChatEvent(this.chatId);
  @override
  List<Object?> get props => [chatId];
}

class EditChatEvent extends ChatEvent {}

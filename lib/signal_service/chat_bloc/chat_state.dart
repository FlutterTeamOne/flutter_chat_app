part of 'chat_bloc.dart';

class ChatState {
  final List<ChatModel>? chats;
  ChatState({
    this.chats,
  });

  ChatState copyWith({
    List<ChatModel>? chats,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
    );
  }
}

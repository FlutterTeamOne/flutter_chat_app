import 'package:equatable/equatable.dart';

import '../../../domain/data/library/library_data.dart';

class ChatStateRef extends Equatable {
  final List<ChatDto>? chats;
  final int? chatId;
  final int? localChatId;

  const ChatStateRef({this.chats, this.chatId, this.localChatId});

  ChatStateRef copyWith({List<ChatDto>? chats, int? chatId}) {
    return ChatStateRef(
      chats: chats ?? this.chats,
      chatId: chatId ?? this.chatId,
    );
  }

  @override
  List<Object?> get props => [chats, chatId, localChatId];
}

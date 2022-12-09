import 'package:chat_app/domain/data/library/library_data.dart';

class ChatDto extends ModelDto {
  final int localChatId;
  final int chatIdMain;
  final int friendId;

  ChatDto({
    required this.localChatId,
    required this.chatIdMain,
    required this.friendId,
  });
}
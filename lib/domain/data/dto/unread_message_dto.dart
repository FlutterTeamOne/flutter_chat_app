import 'package:chat_app/domain/data/library/library_data.dart';

class LastUnreadMessageDto extends ModelDto {

  final int lastUnreadMessageId;
  final int friendsChatId;
  final bool isRead;

  LastUnreadMessageDto({
    required this.lastUnreadMessageId,
    required this.friendsChatId,
    required this.isRead,
  });

}
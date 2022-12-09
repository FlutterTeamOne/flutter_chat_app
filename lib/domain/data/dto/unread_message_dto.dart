import 'model_dto.dart';
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
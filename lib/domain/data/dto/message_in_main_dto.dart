import 'package:chat_app/domain/data/library/library_data.dart';

class MessageIdInMainDto extends ModelDto {
  final int mainMessageId;
  final int localMessageId;

  MessageIdInMainDto({
    required this.mainMessageId,
    required this.localMessageId,
  });

}
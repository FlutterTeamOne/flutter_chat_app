import 'package:chat_app/domain/data/library/library_data.dart';

class MessageDto extends ModelDto {
  late int? localMessageId;
  final int localChatId;
  final int localSendId;
  final String date;
  final int isWrittenToDb;
  final String content;

  MessageDto(
      {this.localMessageId,
        required this.localChatId,
        required this.localSendId,
        required this.date,
        this.isWrittenToDb = 0,
        required this.content});

}